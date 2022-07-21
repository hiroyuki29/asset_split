import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../asset/data/asset_isar_provider.dart';
import '../data/local_user_repository_impl.dart';
import 'model/user.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.watch(isarProvider));
});

final userListStreamProvider = StreamProvider<List<User>>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  userRepository.watchUsers();
  return userRepository.userDataStream;
});

abstract class UserRepository {
  Stream<List<User>> get userDataStream;
  Future<List<User>> fetchUsers();
  Future<void> select(int userId);
  Future<User?> fetchOneUser(int userId);
  Future<void> watchUsers();
  Future<int> setUser(User user);
  Future<int?> removeUser(int userId);
  Future<void> updateUser({
    required int id,
    required String name,
    required DateTime createDateTime,
    required double sumAmount,
    required double payBackAmount,
  });
}
