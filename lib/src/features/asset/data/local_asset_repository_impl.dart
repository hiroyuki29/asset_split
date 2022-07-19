import 'dart:async';
import 'dart:typed_data';

import 'package:asset_split/src/features/asset/data/asset_isar_provider.dart';
import 'package:asset_split/src/features/asset/data/collections/asset_data.dart';
import 'package:asset_split/src/features/asset/domain/local_asset_repository.dart';
import 'package:asset_split/src/features/asset/domain/model/asset.dart';
import 'package:asset_split/src/features/user/data/current_user_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final assetRepositoryProvider = Provider<AssetRepository>((ref) {
  final userIdAsyncValue = ref.watch(currentUserIdProvider);
  var userId = userIdAsyncValue.value;
  if (userId != null) {
    return AssetRepositoryImpl(isar: ref.watch(isarProvider), userId: userId);
  } else {
    return AssetRepositoryImpl(isar: ref.watch(isarProvider), userId: 0);
  }
});

final assetListStreamProvider = StreamProvider.autoDispose<AssetList>((ref) {
  final assetRepository = ref.watch(assetRepositoryProvider);
  assetRepository.watchAssets();
  return assetRepository.assetDataStream;
});

class AssetRepositoryImpl implements AssetRepository {
  AssetRepositoryImpl({required this.isar, required this.userId}) {
    isar.assetDatas.watchLazy().listen((_) async {
      if (!isar.isOpen) {
        return;
      }
      if (_assetDataStreamController.isClosed) {
        return;
      }
      _assetDataStreamController.sink.add(await fetchAssets());
    });
  }

  // final Ref ref;
  final Isar isar;
  final int userId;
  final _assetDataStreamController = StreamController<AssetList>.broadcast();

  @override
  Stream<AssetList> get assetDataStream => _assetDataStreamController.stream;

  @override
  Future<AssetList> fetchAssets() async {
    if (!isar.isOpen) {
      return AssetList([]);
    }
    final allAssetDatas =
        await isar.assetDatas.filter().userIdEqualTo(userId).findAll();

    AssetList list = AssetList([]);
    for (AssetData data in allAssetDatas) {
      Asset asset = Asset.fromAssetData(data);
      list.add(asset);
    }
    return list;
  }

  @override
  Future<AssetList> fetchAllAssets() async {
    if (!isar.isOpen) {
      return AssetList([]);
    }
    final allAssetDatas = await isar.assetDatas.where().findAll();

    AssetList list = AssetList([]);
    for (AssetData data in allAssetDatas) {
      Asset asset = Asset.fromAssetData(data);
      list.add(asset);
    }
    return list;
  }

  @override
  Future<void> watchAssets() async {
    _assetDataStreamController.sink.add(await fetchAssets());
  }

  @override
  Future<void> setAsset(Asset asset) async {
    final newAssetData = AssetData()
      ..name = asset.name.assetName
      ..userId = asset.userId
      ..image = asset.image
      ..cost = asset.cost.amount
      ..period = asset.period.amountList
      ..purchaseDate = asset.purchaseDate
      ..repayment = asset.repayment.amount;
    await isar.writeTxn((isar) async {
      await isar.assetDatas.put(newAssetData);
    });
  }

  @override
  Future<void> removeAsset(int assetId) async {
    await isar.writeTxn((isar) async {
      return isar.assetDatas.delete(assetId);
    });
  }

  @override
  Future<void> updateAsset({
    required int id,
    required String name,
    required Uint8List image,
    required double cost,
    required List<int> period,
    required DateTime purchaseDate,
    required double repayment,
  }) async {
    if (!isar.isOpen) {
      return Future<void>(() {});
    }
    AssetData? assetData = await isar.assetDatas.get(id);
    if (assetData == null) {
      return Future<void>(() {});
    }
    if (repayment >= cost) {
      repayment = cost;
    }
    assetData
      ..name = name
      // ..image = image
      ..cost = cost
      ..period = period
      ..purchaseDate = purchaseDate
      ..repayment = repayment;

    isar.writeTxn((isar) async {
      await isar.assetDatas.put(assetData);
    });
  }
}
