import 'package:asset_split/src/features/user/use_case/user_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/current_user_repository.dart';
import '../domain/model/user.dart';
import '../domain/value/user_name.dart';

final currentUserStateProvider =
    StateNotifierProvider.autoDispose<CurrentUserState, AsyncValue<int>>((ref) {
  final userState = CurrentUserState(
    userUseCase: ref.watch(userUseCaseProvider),
  );
  ref.listen<AsyncValue<int>>(currentUserIdProvider, ((previous, next) {
    userState.stateChange(next.value!);
  }));
  return userState;
});

class CurrentUserState extends StateNotifier<AsyncValue<int>> {
  CurrentUserState({
    required this.userUseCase,
  }) : super(const AsyncData(0)) {
    _readPref();
  }

  final UserUseCase userUseCase;

  void _readPref() async {
    state = AsyncValue.data(await userUseCase.fetchCurrentUserId());
  }

  void stateChange(int userId) {
    state = AsyncValue.data(userId);
  }

  void changeCurrentUser(int userId) async {
    await userUseCase.select(userId);
    state = AsyncValue.data(userId);
  }

  Future<void> addNewUser({
    required UserName name,
  }) async {
    User newUser = User.initCreate(
      name: name,
    );
    int newUserId = await userUseCase.add(newUser);
    state = AsyncValue.data(newUserId);
  }

  Future<void> remove(int userId) async {
    state = const AsyncLoading();
    int nextUserId = await userUseCase.remove(userId) ?? 0;
    state = AsyncValue.data(nextUserId);
  }
}
