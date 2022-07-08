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
    required String imageUrl,
    required Money cost,
    required int priod,
  }) async {
    state = const AsyncLoading();
    Asset newAsset = Asset.initCreate(
      name: name,
      imageUrl: imageUrl,
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
    String? imageUrl,
    Money? cost,
    int? priod,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => assetUseCase.update(
          id: asset.id,
          name: name ?? asset.name,
          imageUrl: imageUrl ?? asset.imageUrl,
          cost: cost ?? asset.cost,
          priod: priod ?? asset.depreciationPriodOfMonth,
        ));
  }
}
