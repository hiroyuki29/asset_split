import 'package:asset_split/src/features/asset/data/collections/asset_data.dart';
import 'package:asset_split/src/features/asset/domain/local_asset_repository.dart';
import 'package:asset_split/src/features/asset/domain/model/asset.dart';
import 'package:isar/isar.dart';

class LocalAssetRepositoryImpl implements LocalAssetRepository {
  LocalAssetRepositoryImpl(this.isar);
  final Isar isar;
  @override
  Future<AssetList> fetchAseets() async {
    if (!isar.isOpen) {
      return AssetList([]);
    }
    final assets = await isar.assetDatas.where().findAll();
    List<Asset> list = [];
    for (AssetData assetData in assets) {
      Map<String, dynamic> map = assetData.toMap();
      Asset asset = Asset.fromMap(map);
      list.add(asset);
    }
    return AssetList(list);
  }

  @override
  Future<void> setAsset(Asset asset) async {
    final newAssetData = AssetData()
      ..name = asset.name as String
      ..imageUrl = asset.imageUrl
      ..cost = asset.cost as int
      ..depreciationPriodOfMonth = asset.depreciationPriodOfMonth
      ..purchaseDate = asset.purchaseDate
      ..repayment = asset.repayment as int;
    await isar.writeTxn((isar) async {
      await isar.assetDatas.put(newAssetData);
    });
  }

  @override
  Stream<AssetList> watchAssets() {
    // TODO: implement watchAssets
    throw UnimplementedError();
  }
}
