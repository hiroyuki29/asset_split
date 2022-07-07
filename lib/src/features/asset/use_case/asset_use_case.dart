import '../domain/local_asset_repository.dart';
import '../domain/model/asset.dart';

class AssetUseCase {
  AssetUseCase({required this.localAssetRepository});

  final LocalAssetRepository localAssetRepository;
  Future<AssetList> add(Asset newAsset) async {
    final AssetList assetList = await localAssetRepository.fetchAseets();
    final updated = assetList.add(newAsset);
    await localAssetRepository.setAssets(updated);
    return localAssetRepository.fetchAseets();
  }
}
