import 'dart:typed_data';

import 'package:asset_split/src/features/asset/domain/value/priod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../user/domain/value/money_amount.dart';
import '../data/local_asset_repository_impl.dart';
import '../domain/local_asset_repository.dart';
import '../domain/model/asset.dart';
import '../domain/value/asset_name.dart';

final assetUseCaseProvider = Provider.autoDispose<AssetUseCase>((ref) {
  return AssetUseCase(
    localAssetRepository: ref.watch(localAssetRepositoryProvider),
  );
});

class AssetUseCase {
  AssetUseCase({required this.localAssetRepository});

  final LocalAssetRepository localAssetRepository;

  Future<AssetList> fetchAssets() async {
    return await localAssetRepository.fetchAssets();
  }

  Future<void> add(Asset newAsset) async {
    await localAssetRepository.setAsset(newAsset);
    // return localAssetRepository.fetchAllAssets();
  }

  Future<AssetList> remove(int assetId) async {
    await localAssetRepository.removeAsset(assetId);
    return localAssetRepository.fetchAssets();
  }

  Future<void> addPayment(Money add) async {
    AssetList assetList = await localAssetRepository.fetchAssets();
    if (assetList.list.isNotEmpty) {
      assetList.reflectRepaymentForEachAsset(add);
      for (final asset in assetList.list) {
        await updateWithoutFetch(asset: asset!);
      }
    }
  }

  Future<AssetList> update({
    required Asset asset,
    AssetName? name,
    Uint8List? image,
    Money? cost,
    Period? period,
  }) async {
    updateWithoutFetch(
      asset: asset,
      name: name,
      image: image,
      cost: cost,
      period: period,
    );
    return localAssetRepository.fetchAssets();
  }

  Future<void> updateWithoutFetch({
    required Asset asset,
    AssetName? name,
    Uint8List? image,
    Money? cost,
    Period? period,
    DateTime? purchaseDate,
    Money? repayment,
  }) async {
    await localAssetRepository.updateAsset(
        id: asset.id,
        name: (name == null) ? asset.name.assetName : name.assetName,
        image: image ?? asset.image,
        cost: (cost == null) ? asset.cost.amount : cost.amount,
        period: (period == null)
            ? asset.depreciationPriodOfMonth.amount
            : period.amount,
        purchaseDate: purchaseDate ?? asset.purchaseDate,
        repayment:
            (repayment == null) ? asset.repayment.amount : repayment.amount);
  }
}
