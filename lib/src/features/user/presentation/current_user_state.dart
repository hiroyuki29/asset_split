import 'package:asset_split/src/features/user/use_case/user_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/local_user_repository.dart';
import '../domain/model/user.dart';
import '../domain/value/user_name.dart';

final currentUserStateProvider =
    StateNotifierProvider.autoDispose<CurrentUserState, AsyncValue<User?>>(
        (ref) {
  final userState = CurrentUserState(
    userUseCase: ref.watch(userUseCaseProvider),
  );
  ref.listen<AsyncValue<User>>(currentUserStreamProvider, ((previous, next) {
    userState.stateChangeFromStream(next.value!);
  }));
  return userState;
});

class CurrentUserState extends StateNotifier<AsyncValue<User?>> {
  CurrentUserState({
    required this.userUseCase,
  }) : super(const AsyncData(null)) {
    _readPref();
  }

  final UserUseCase userUseCase;

  void _readPref() async {
    state = AsyncValue.data(await userUseCase.fetchCurrentUser());
  }

  void stateChangeFromStream(User user) {
    state = AsyncValue.data(user);
  }

  void stateChange(User user) {
    userUseCase.select(user);
    state = AsyncData(user);
  }

  // void changeCurrentUser(User user) async {
  //   await userUseCase.select(userId);
  //   state = AsyncValue.data(userId);
  // }

  Future<void> addNewUser({
    required UserName name,
  }) async {
    User setUser = User.initCreate(
      name: name,
    );
    User newUser = await userUseCase.add(setUser);
    state = AsyncValue.data(newUser);
  }

  Future<void> remove(User user) async {
    state = const AsyncLoading();
    User? nextUser = await userUseCase.remove(user);
    state = AsyncValue.data(nextUser);
  }
}
