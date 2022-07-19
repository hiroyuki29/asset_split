import 'dart:typed_data';

import 'model/asset.dart';

abstract class AssetRepository {
  Stream<AssetList> get assetDataStream;
  Future<AssetList> fetchAssets();
  Future<AssetList> fetchAllAssets();
  Future<void> watchAssets();
  Future<void> setAsset(Asset asset);
  Future<void> removeAsset(int assetId);
  Future<void> updateAsset({
    required int id,
    required String name,
    required Uint8List image,
    required double cost,
    required int period,
    required DateTime purchaseDate,
    required double repayment,
  });
}
