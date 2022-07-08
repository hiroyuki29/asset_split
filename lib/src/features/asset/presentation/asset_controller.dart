import 'dart:typed_data';

import 'package:asset_split/src/features/asset/domain/model/asset.dart';
import 'package:asset_split/src/features/asset/domain/value/asset_name.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../user/domain/value/money_amount.dart';
import '../use_case/asset_use_case.dart';

final assetStateProvider =
    StateNotifierProvider.autoDispose<AssetState, AsyncValue<AssetList>>(
        (ref) => AssetState(assetUseCase: ref.watch(assetUseCaseProvider)));

//責務：
class AssetState extends StateNotifier<AsyncValue<AssetList>> {
  AssetState({required this.assetUseCase}) : super(AsyncData(AssetList([]))) {
    _fetchAssets();
  }

  final AssetUseCase assetUseCase;

  void _fetchAssets() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => assetUseCase.fetchAssets());
  }

  void add({
    required AssetName name,
    required Uint8List image,
    required Money cost,
    required int priod,
  }) async {
    state = const AsyncLoading();
    Asset newAsset = Asset.initCreate(
      name: name,
      image: image,
      cost: cost,
      priod: priod,
    );
    state = await AsyncValue.guard(() => assetUseCase.add(newAsset));
  }

  void remove(int id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => assetUseCase.remove(id));
  }

  void update({
    required Asset asset,
    AssetName? name,
    Uint8List? image,
    Money? cost,
    int? priod,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => assetUseCase.update(
          id: asset.id,
          name: name ?? asset.name,
          image: image ?? asset.image,
          cost: cost ?? asset.cost,
          priod: priod ?? asset.depreciationPriodOfMonth,
        ));
  }
}
