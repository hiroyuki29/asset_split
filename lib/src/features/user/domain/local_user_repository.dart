import 'model/user.dart';

abstract class LocalUserRepository {
  Future<List<User>> fetchUsers();
  Future<void> select(int userId);
  Future<User?> fetchOneUser(int userId);
  Stream<List<User>> watchUsers();
  Future<void> setUser(User user);
  Future<void> removeUser(int userId);
  Future<void> updateUser({
    required int id,
    required String name,
    required DateTime createDateTime,
    required double sumAmount,
    required double payBackAmount,
  });
}
