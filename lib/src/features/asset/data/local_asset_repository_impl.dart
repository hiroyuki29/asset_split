import 'dart:async';
import 'dart:typed_data';

import 'package:asset_split/src/features/asset/data/asset_isar_provider.dart';
import 'package:asset_split/src/features/asset/data/collections/asset_data.dart';
import 'package:asset_split/src/features/asset/domain/local_asset_repository.dart';
import 'package:asset_split/src/features/asset/domain/model/asset.dart';
import 'package:asset_split/src/features/user/presentation/current_user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final localAssetRepositoryProvider = Provider<LocalAssetRepository>((ref) {
  return LocalAssetRepositoryImpl(
      isar: ref.watch(isarProvider), userId: ref.watch(currentUserIdProvider)!);
});

final localAssetListStreamProvider = StreamProvider<AssetList>((ref) {
  final localAssetRepository = ref.watch(localAssetRepositoryProvider);
  return localAssetRepository.assetDataStream;
});

class LocalAssetRepositoryImpl implements LocalAssetRepository {
  LocalAssetRepositoryImpl({required this.isar, required this.userId}) {
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
  Future<void> setAsset(Asset asset) async {
    final newAssetData = AssetData()
      ..name = asset.name.assetName
      ..userId = asset.userId
      ..image = asset.image
      ..cost = asset.cost.amount
      ..depreciationPriodOfMonth = asset.depreciationPriodOfMonth.amount
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
    required int period,
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
      ..image = image
      ..cost = cost
      ..depreciationPriodOfMonth = period
      ..purchaseDate = purchaseDate
      ..repayment = repayment;

    isar.writeTxn((isar) async {
      await isar.assetDatas.put(assetData);
    });
  }
}
