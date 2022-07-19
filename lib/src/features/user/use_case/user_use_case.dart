import 'package:asset_split/src/features/user/data/current_user_repository_impl.dart';
import 'package:asset_split/src/features/user/domain/current_user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/local_user_repository_impl.dart';
import '../domain/local_user_repository.dart';
import '../domain/model/user.dart';
import '../domain/value/money_amount.dart';
import '../domain/value/user_name.dart';

final userUseCaseProvider = Provider<UserUseCase>(
  (ref) {
    return UserUseCase(
      userRepository: ref.watch(userRepositoryProvider),
      currentUserRepository: ref.watch(currentUserRepositoryProvider),
    );
  },
);

class UserUseCase {
  UserUseCase(
      {required this.userRepository, required this.currentUserRepository});

  final UserRepository userRepository;
  final CurrentUserRepository currentUserRepository;

  Future<List<User>> fetchUsers() async {
    return await userRepository.fetchUsers();
  }

  Future<void> select(int userId) async {
    await currentUserRepository.select(userId);
  }

  Future<int> fetchCurrentUserId() async {
    return await currentUserRepository.fetchCurrentUser();
  }

  Future<User?> fetchOneUser(int userId) async {
    User? user = await userRepository.fetchOneUser(userId);
    return user;
  }

  Future<int> add(User newUser) async {
    int newUserId = await userRepository.setUser(newUser);
    return newUserId;
  }

  Future<void> remove(int userId) async {
    await userRepository.removeUser(userId);
  }

  Future<void> addPayment({required User user, required Money add}) async {
    Money addedPayment = user.payBackAmount.add(add);
    await userRepository.updateUser(
      id: user.id,
      name: user.name.name,
      createDateTime: user.createDateTime,
      sumAmount: user.sumAmount.amount,
      payBackAmount: addedPayment.amount,
    );
  }

  Future<void> updateWithoutFetch({
    required User user,
    UserName? name,
    Money? sumAmount,
    Money? payBackAmount,
  }) async {
    await userRepository.updateUser(
        id: user.id,
        name: (name == null) ? user.name.name : name.name,
        createDateTime: user.createDateTime,
        sumAmount:
            (sumAmount == null) ? user.sumAmount.amount : sumAmount.amount,
        payBackAmount: (payBackAmount == null)
            ? user.payBackAmount.amount
            : payBackAmount.amount);
  }
}
