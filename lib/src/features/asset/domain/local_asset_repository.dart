import 'model/asset.dart';

abstract class LocalAssetRepository {
  Future<AssetList> fetchAseets();
  Stream<AssetList> watchAssets();
  Future<void> setAsset(Asset asset);
  Future<void> removeAsset(int assetId);
  Future<void> updateAsset({
    required int id,
    required String name,
    required String imageUrl,
    required int cost,
    required int priod,
  });
}
