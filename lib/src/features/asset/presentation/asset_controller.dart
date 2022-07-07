import 'package:asset_split/src/features/asset/domain/model/asset.dart';
import 'package:asset_split/src/features/asset/domain/value/asset_name.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../user/domain/value/money_amount.dart';
import '../use_case/asset_use_case.dart';

//責務：
class AssetState extends StateNotifier<AsyncValue<AssetList>> {
  AssetState({required this.assetUseCase}) : super(AsyncData(AssetList([])));

  final AssetUseCase assetUseCase;

  void add(
    int id,
    AssetName name,
    String imageUrl,
    Money cost,
    int priod,
  ) async {
    Asset newAsset = Asset.initCreate(id, name, imageUrl, cost, priod);
    // assetUseCase.add(newAsset);
    // List<Asset?> list = state.assetList;
    // list.add(newAsset);
    // state = AssetList(list);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => assetUseCase.add(newAsset));
  }

  // void remove(int id) {
  //   List<Asset?> list = state.assetList;
  //   if (list.isNotEmpty) {
  //     list.where((asset) => asset!.id != id).toList();
  //   }
  //   state = AssetList(list);
  // }
}
