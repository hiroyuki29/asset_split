import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../user/domain/current_user_repository.dart';
import '../data/asset_isar_provider.dart';
import '../data/local_asset_repository_impl.dart';
import 'model/asset.dart';

final assetRepositoryProvider = Provider<AssetRepository>((ref) {
  final userIdAsyncValue = ref.watch(currentUserIdProvider);
  var userId = userIdAsyncValue.value;
  if (userId != null) {
    return AssetRepositoryImpl(isar: ref.watch(isarProvider), userId: userId);
  } else {
    return AssetRepositoryImpl(isar: ref.watch(isarProvider), userId: 0);
  }
});

final assetListStreamProvider = StreamProvider.autoDispose<AssetList>((ref) {
  final assetRepository = ref.watch(assetRepositoryProvider);
  assetRepository.watchAssets();
  return assetRepository.assetDataStream;
});

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
    required List<int> period,
    required DateTime purchaseDate,
    required double repayment,
  });
}
