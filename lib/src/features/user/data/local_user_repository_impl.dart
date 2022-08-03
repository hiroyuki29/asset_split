import 'dart:async';
import 'package:asset_split/src/features/asset/data/collections/asset_data.dart';
import 'package:asset_split/src/features/user/data/user_data.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/local_user_repository.dart';
import '../domain/model/user.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.isar) {
    isar.userDatas.watchLazy().listen((_) async {
      if (!isar.isOpen) {
        return;
      }
      if (_userDataStreamController.isClosed) {
        return;
      }
      _userDataStreamController.sink.add(await fetchUsers());
    });
  }
  final Isar isar;
  final _userDataStreamController = StreamController<List<User>>.broadcast();
  final _currentUserDataStreamController = StreamController<User>.broadcast();

  @override
  Stream<List<User>> get userDataStream => _userDataStreamController.stream;

  @override
  Stream<User> get currentUserDataStream =>
      _currentUserDataStreamController.stream;

  @override
  Future<List<User>> fetchUsers() async {
    if (!isar.isOpen) {
      return [];
    }
    final allUserDatas = await isar.userDatas.where().findAll();
    List<User> list = [];
    for (UserData data in allUserDatas) {
      User user = User.fromUserData(data);
      list.add(user);
    }
    return list;
  }

  @override
  Future<User?> fetchCurrentUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? currentUserId = pref.getInt('currentUserId') ?? 0;
    User? currentUser = await fetchOneUser(currentUserId);
    if (currentUser == null) {
      return null;
    }
    _currentUserDataStreamController.sink.add(currentUser);
    return currentUser;
  }

  @override
  Future<void> watchUsers() async {
    _userDataStreamController.sink.add(await fetchUsers());
  }

  @override
  Future<User?> removeUser(User user) async {
    await isar.writeTxn(() async {
      final assetsOfDeleteUser = await isar.assetDatas
          .filter()
          .userIdEqualTo(user.id)
          .idProperty()
          .findAll();
      isar.assetDatas.deleteAll(assetsOfDeleteUser);
      await isar.userDatas.delete(user.id);
    });
    UserData? nextUserData = await isar.userDatas.where().findFirst();
    if (nextUserData == null) {
      return null;
    }
    User nextUser = User.fromUserData(nextUserData);
    return nextUser;
  }

  @override
  Future<User> setUser(User user) async {
    final newUserData = UserData()
      ..name = user.name.name
      ..createDateTime = user.createDateTime
      ..sumAmount = user.sumAmount.amount
      ..payBackAmount = user.payBackAmount.amount;
    int currentUserId = await isar.writeTxn(() async {
      return await isar.userDatas.put(newUserData);
    });
    User? currentUser = await fetchOneUser(currentUserId);
    return currentUser!;
  }

  @override
  Future<void> updateUser({
    required int id,
    required String name,
    required DateTime createDateTime,
    required double sumAmount,
    required double payBackAmount,
  }) async {
    if (!isar.isOpen) {
      return Future<void>(() {});
    }
    UserData? userData = await isar.userDatas.get(id);
    if (userData == null) {
      return Future<void>(() {});
    }
    userData
      ..name = name
      ..createDateTime = createDateTime
      ..sumAmount = sumAmount
      ..payBackAmount = payBackAmount;
    isar.writeTxn(() async {
      await isar.userDatas.put(userData);
    });
  }

  @override
  Future<User?> fetchOneUser(int userId) async {
    if (!isar.isOpen) {
      return null;
    }
    UserData? data = await isar.userDatas.get(userId);
    if (data == null) {
      return null;
    }
    return User.fromUserData(data);
  }

  @override
  Future<void> select(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('currentUserId', user.id);
    _currentUserDataStreamController.sink.add(user);
  }
}
