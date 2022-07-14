import 'package:asset_split/src/features/asset/presentation/asset_controller.dart';
import 'package:asset_split/src/features/user/use_case/user_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final currentUserIdProvider =
    StateNotifierProvider.autoDispose<CurrentUserState, int?>(
  (ref) => CurrentUserState(
      userUseCase: ref.watch(userUseCaseProvider),
      assetState: ref.watch(assetStateProvider.notifier)),
);

class CurrentUserState extends StateNotifier<int?> {
  CurrentUserState({required this.userUseCase, required this.assetState})
      : super(null) {
    _readPref();
  }

  final UserUseCase userUseCase;
  final AssetState assetState;

  void _readPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    state = pref.getInt('currentUserId');
  }

  void changeCurrentUser(int userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await userUseCase.select(userId);
    state = pref.getInt('currentUserId');
    assetState.fetchAssets();
  }
}
