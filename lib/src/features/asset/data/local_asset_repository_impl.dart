import 'dart:async';

import 'package:asset_split/src/features/asset/data/asset_isar_provider.dart';
import 'package:asset_split/src/features/asset/data/collections/asset_data.dart';
import 'package:asset_split/src/features/asset/domain/local_asset_repository.dart';
import 'package:asset_split/src/features/asset/domain/model/asset.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final localAssetRepositoryProvider = Provider<LocalAssetRepository>((ref) {
  return LocalAssetRepositoryImpl(ref.watch(isarProvider));
});

class LocalAssetRepositoryImpl implements LocalAssetRepository {
  LocalAssetRepositoryImpl(this.isar) {
    isar.assetDatas.watchLazy().listen((_) async {
      if (!isar.isOpen) {
        return;
      }
      if (_assetDataStreamController.isClosed) {
        return;
      }
      _assetDataStreamController.sink.add(await findAssets());
    });
  }

  final Isar isar;

  final _assetDataStreamController = StreamController<AssetList>.broadcast();

  Stream<AssetList> get assetDataStream => _assetDataStreamController.stream;

  Future<AssetList> findAssets() async {
    if (!isar.isOpen) {
      return AssetList([]);
    }
    AssetList list = AssetList([]);
    final assetDatas = await isar.assetDatas.where().findAll();
    for (AssetData data in assetDatas) {
      list.add(Asset.fromAssetData(data));
    }
    return list;
  }

  @override
  Future<AssetList> fetchAseets() async {
    if (!isar.isOpen) {
      return AssetList([]);
    }
    final assetDatas = await isar.assetDatas.where().findAll();
    AssetList list = AssetList([]);
    for (AssetData data in assetDatas) {
      Asset asset = Asset.fromAssetData(data);
      list.add(asset);
    }
    return list;
  }

  @override
  Future<void> setAsset(Asset asset) async {
    final newAssetData = AssetData()
      ..name = asset.name.assetName
      ..imageUrl = asset.imageUrl
      ..cost = asset.cost.amount
      ..depreciationPriodOfMonth = asset.depreciationPriodOfMonth
      ..purchaseDate = asset.purchaseDate
      ..repayment = asset.repayment.amount;
    await isar.writeTxn((isar) async {
      await isar.assetDatas.put(newAssetData);
    });
  }

  @override
  Stream<AssetList> watchAssets() async* {
    isar.assetDatas.watchLazy().listen((event) async {});
  }

  @override
  Future<void> removeAsset(int assetId) async {
    isar.writeTxn((isar) async {
      return isar.assetDatas.delete(assetId);
    });
  }

  @override
  Future<void> updateAsset({
    required int id,
    required String name,
    required String imageUrl,
    required int cost,
    required int priod,
  }) async {
    if (!isar.isOpen) {
      return Future<void>(() {});
    }
    AssetData? assetData = await isar.assetDatas.get(id);
    if (assetData == null) {
      return Future<void>(() {});
    }
    assetData
      ..name = name
      ..imageUrl = imageUrl
      ..cost = cost
      ..depreciationPriodOfMonth = priod;

    return isar.writeTxn((isar) async {
      await isar.assetDatas.put(assetData);
    });
  }
}
