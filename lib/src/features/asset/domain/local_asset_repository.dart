import 'model/asset.dart';

abstract class LocalAssetRepository {
  Future<AssetList> fetchAseets();
  Stream<AssetList> watchAssets();
  Future<void> setAssets(AssetList assetList);
}
