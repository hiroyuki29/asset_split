import 'model/user.dart';

abstract class UserRepository {
  Stream<List<User>> get userDataStream;
  Future<List<User>> fetchUsers();
  Future<void> select(int userId);
  Future<User?> fetchOneUser(int userId);
  Future<void> watchUsers();
  Future<int> setUser(User user);
  Future<void> removeUser(int userId);
  Future<void> updateUser({
    required int id,
    required String name,
    required DateTime createDateTime,
    required double sumAmount,
    required double payBackAmount,
  });
}
