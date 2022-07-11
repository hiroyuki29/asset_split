import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../user/domain/value/money_amount.dart';
import '../data/local_asset_repository_impl.dart';
import '../domain/local_asset_repository.dart';
import '../domain/model/asset.dart';
import '../domain/value/asset_name.dart';

final assetUseCaseProvider = Provider<AssetUseCase>((ref) {
  return AssetUseCase(
      localAssetRepository: ref.watch(localAssetRepositoryProvider));
});

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

  Future<AssetList> addPayment(Money add) async {
    AssetList assetList = await localAssetRepository.fetchAseets();
    if (assetList.list.isNotEmpty) {
      assetList.reflectRepaymentForEachAsset(add);
      for (final asset in assetList.list) {
        await updateWithoutFetch(asset: asset!);
      }
    }
    return localAssetRepository.fetchAseets();
  }

  Future<AssetList> update({
    required Asset asset,
    AssetName? name,
    Uint8List? image,
    Money? cost,
    int? priod,
  }) async {
    updateWithoutFetch(
      asset: asset,
      name: name,
      image: image,
      cost: cost,
      priod: priod,
    );
    return localAssetRepository.fetchAseets();
  }

  Future<void> updateWithoutFetch({
    required Asset asset,
    AssetName? name,
    Uint8List? image,
    Money? cost,
    int? priod,
    DateTime? purchaseDate,
    Money? repayment,
  }) async {
    final String assetName;
    final int assetCost;
    final int assetRepayment;
    if (name == null) {
      assetName = asset.name.assetName;
    } else {
      assetName = name.assetName;
    }
    if (cost == null) {
      assetCost = asset.cost.amount;
    } else {
      assetCost = cost.amount;
    }
    if (repayment == null) {
      assetRepayment = asset.repayment.amount;
    } else {
      assetRepayment = repayment.amount;
    }
    await localAssetRepository.updateAsset(
        id: asset.id,
        name: assetName,
        image: image ?? asset.image,
        cost: assetCost,
        priod: priod ?? asset.depreciationPriodOfMonth,
        purchaseDate: purchaseDate ?? asset.purchaseDate,
        repayment: assetRepayment);
  }
}
