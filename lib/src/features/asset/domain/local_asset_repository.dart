import 'dart:typed_data';

import 'model/asset.dart';

abstract class LocalAssetRepository {
  Future<AssetList> fetchAseets();
  Stream<AssetList> watchAssets();
  Future<void> setAsset(Asset asset);
  Future<void> removeAsset(int assetId);
  Future<void> updateAsset({
    required int id,
    required String name,
    required Uint8List image,
    required int cost,
    required int priod,
  });
}
