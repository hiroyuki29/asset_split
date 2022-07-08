import '../../user/domain/value/money_amount.dart';
import '../domain/local_asset_repository.dart';
import '../domain/model/asset.dart';
import '../domain/value/asset_name.dart';

class AssetUseCase {
  AssetUseCase({required this.localAssetRepository});

  final LocalAssetRepository localAssetRepository;

  Future<AssetList> fetchAssets() async {
    return localAssetRepository.fetchAseets();
  }

  Future<AssetList> add(Asset newAsset) async {
    await localAssetRepository.setAsset(newAsset);
    return localAssetRepository.fetchAseets();
  }

  Future<AssetList> remove(int assetId) async {
    await localAssetRepository.removeAsset(assetId);
    return localAssetRepository.fetchAseets();
  }

  Future<AssetList> update({
    required int id,
    required AssetName name,
    required String imageUrl,
    required Money cost,
    required int priod,
  }) async {
    await localAssetRepository.updateAsset(id: id, name: name);
    return localAssetRepository.fetchAseets();
  }
}
