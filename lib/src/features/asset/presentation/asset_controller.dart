// import 'dart:typed_data';

// import 'package:asset_split/src/features/asset/domain/model/asset.dart';
// import 'package:asset_split/src/features/asset/domain/value/asset_name.dart';
// import 'package:asset_split/src/features/asset/domain/value/priod.dart';
// import 'package:asset_split/src/features/user/data/current_user_repository_impl.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../user/domain/value/money_amount.dart';
// import '../data/local_asset_repository_impl.dart';
// import '../use_case/asset_use_case.dart';

// final assetControllerProvider =
//     StateNotifierProvider.autoDispose<AssetState, AsyncValue<AssetList>>((ref) {
//   // final int userId = ref.read(currentUserStateProvider);
//   final notifier = AssetState(
//     assetUseCase: ref.read(assetUseCaseProvider),
//     // userId: userId,
//   );
//   ref.listen<AsyncValue<AssetList>>(assetListStreamProvider, ((previous, next) {
//     notifier.stateChange(next);
//   }));
//   ref.listen<AsyncValue<int>>(currentUserIdProvider, ((previous, next) async {
//     // notifier.setUserId = next;
//     await notifier.fetchAssets();
//   }));

//   return notifier;
// });

// class AssetState extends StateNotifier<AsyncValue<AssetList>> {
//   AssetState({
//     required this.assetUseCase,
//     // required this.userId,
//   }) : super(AsyncData(AssetList([]))) {
//     fetchAssets();
//   }

//   final AssetUseCase assetUseCase;
//   // int userId;

//   // set setUserId(int id) {
//   //   userId = id;
//   // }

//   void stateChange(AsyncValue<AssetList> value) {
//     state = value;
//   }

//   Future<void> fetchAssets() async {
//     state = const AsyncLoading();
//     state = AsyncValue.data(await assetUseCase.fetchAssets());
//   }

  // void add({
  //   required int userId,
  //   required AssetName name,
  //   required Uint8List image,
  //   required Money cost,
  //   required Period period,
  // }) async {
  //   state = const AsyncLoading();
  //   Asset newAsset = Asset.initCreate(
  //     userId: userId,
  //     name: name,
  //     image: image,
  //     cost: cost,
  //     period: period,
  //   );
  //   // state = await AsyncValue.guard(() => assetUseCase.add(newAsset));
  //   assetUseCase.add(asset: newAsset);
  // }

//   void remove(int id) async {
//     state = const AsyncLoading();
//     assetUseCase.remove(id);
//   }

//   Future<void> addPayment(
//       {required Money add, required AssetList assetList}) async {
//     state = const AsyncLoading();
//     // state = await AsyncValue.guard(
//     // () =>
//     await assetUseCase.addPayment(add: add, assetList: assetList);
//   }

//   void update({
//     required Asset asset,
//     AssetName? name,
//     Uint8List? image,
//     Money? cost,
//     Period? period,
//   }) async {
//     state = const AsyncLoading();
//     assetUseCase.update(
//       asset: asset,
//       name: name,
//       image: image,
//       cost: cost,
//       period: period,
//     );
//   }
// }
