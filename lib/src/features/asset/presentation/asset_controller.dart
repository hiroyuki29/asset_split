import 'dart:typed_data';

import 'package:asset_split/src/features/asset/data/local_asset_repository_impl.dart';
import 'package:asset_split/src/features/asset/domain/model/asset.dart';
import 'package:asset_split/src/features/asset/domain/value/asset_name.dart';
import 'package:asset_split/src/features/asset/domain/value/priod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../user/domain/value/money_amount.dart';
import '../use_case/asset_use_case.dart';

final assetControllerProvider =
    StateNotifierProvider.autoDispose<AssetState, AsyncValue<AssetList>>((ref) {
  final notifier = AssetState(assetUseCase: ref.watch(assetUseCaseProvider));
  ref.listen<AsyncValue<AssetList>>(localAssetListStreamProvider,
      ((previous, next) {
    notifier.stateChange(next);
  }));

  return notifier;
});

class AssetState extends StateNotifier<AsyncValue<AssetList>> {
  AssetState({
    required this.assetUseCase,
  }) : super(AsyncData(AssetList([]))) {
    fetchAssets();
  }

  final AssetUseCase assetUseCase;

  void stateChange(AsyncValue<AssetList> value) {
    state = value;
  }

  Future<void> fetchAssets() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => assetUseCase.fetchAssets());
  }

  void add({
    required int userId,
    required AssetName name,
    required Uint8List image,
    required Money cost,
    required Period period,
  }) async {
    state = const AsyncLoading();
    Asset newAsset = Asset.initCreate(
      userId: userId,
      name: name,
      image: image,
      cost: cost,
      period: period,
    );
    // state = await AsyncValue.guard(() => assetUseCase.add(newAsset));
    assetUseCase.add(newAsset);
  }

  void remove(int id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => assetUseCase.remove(id));
  }

  Future<void> addPayment(Money add) async {
    // state = const AsyncLoading();
    // state = await AsyncValue.guard(
    // () =>
    await assetUseCase.addPayment(add);
  }

  void update({
    required Asset asset,
    AssetName? name,
    Uint8List? image,
    Money? cost,
    Period? period,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => assetUseCase.update(
          asset: asset,
          name: name,
          image: image,
          cost: cost,
          period: period,
        ));
  }
}
