import 'package:asset_split/src/features/asset/data/local_asset_repository_impl.dart';
import 'package:asset_split/src/features/asset/domain/local_asset_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/local_user_repository_impl.dart';
import '../domain/local_user_repository.dart';
import '../domain/model/user.dart';
import '../domain/value/money_amount.dart';
import '../domain/value/user_name.dart';

final userUseCaseProvider = Provider.autoDispose<UserUseCase>(
  (ref) {
    return UserUseCase(
        localUserRepository: ref.watch(localUserRepositoryProvider),
        localAssetRepository: ref.watch(localAssetRepositoryProvider));
  },
);

class UserUseCase {
  UserUseCase(
      {required this.localUserRepository, required this.localAssetRepository});

  final LocalUserRepository localUserRepository;
  final LocalAssetRepository localAssetRepository;

  Future<List<User>> fetchUsers() async {
    return await localUserRepository.fetchUsers();
  }

  Future<void> select(int userId) async {
    await localUserRepository.select(userId);
    await localAssetRepository.fetchAllAseets();
  }

  Future<User?> fetchOneUser(int userId) async {
    User? user = await localUserRepository.fetchOneUser(userId);
    return user;
  }

  Future<List<User>> add(User newUser) async {
    await localUserRepository.setUser(newUser);
    return await localUserRepository.fetchUsers();
  }

  Future<List<User>> remove(int userId) async {
    await localUserRepository.removeUser(userId);
    return await localUserRepository.fetchUsers();
  }

  Future<void> addPayment({required User user, required Money add}) async {
    Money addedPayment = user.payBackAmount.add(add);
    await localUserRepository.updateUser(
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
    await localUserRepository.updateUser(
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
