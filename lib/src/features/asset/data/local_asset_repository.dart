import '../domain/model/asset.dart';

abstract class LocalAssetRepository {
  Future<Asset> fetchAseet();
  Stream<Asset> watchAsset();
  Future<void> setAsset(Asset asset);
}
