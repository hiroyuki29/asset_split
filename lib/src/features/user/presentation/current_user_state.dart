import 'package:asset_split/src/features/user/use_case/user_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/model/user.dart';
import '../domain/value/user_name.dart';

final currentUserStateProvider =
    StateNotifierProvider.autoDispose<CurrentUserState, int>((ref) {
  return CurrentUserState(userUseCase: ref.watch(userUseCaseProvider));
});

class CurrentUserState extends StateNotifier<int> {
  CurrentUserState({
    required this.userUseCase,
  }) : super(0) {
    _readPref();
  }

  final UserUseCase userUseCase;

  void _readPref() async {
    state = await userUseCase.fetchCurrentUserId();
  }

  void changeCurrentUser(int userId) async {
    await userUseCase.select(userId);
    state = userId;
  }

  Future<void> addNewUser({
    required UserName name,
  }) async {
    User newUser = User.initCreate(
      name: name,
    );
    int newUserId = await userUseCase.add(newUser);
    state = newUserId;
  }
}
