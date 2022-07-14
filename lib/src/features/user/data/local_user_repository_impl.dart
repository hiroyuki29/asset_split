import 'dart:async';

import 'package:asset_split/src/features/user/data/user_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../asset/data/asset_isar_provider.dart';
import '../domain/local_user_repository.dart';
import '../domain/model/user.dart';

final localUserRepositoryProvider = Provider<LocalUserRepository>((ref) {
  return LocalUserRepositoryImpl(ref.watch(isarProvider));
});

class LocalUserRepositoryImpl implements LocalUserRepository {
  LocalUserRepositoryImpl(this.isar) {
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
  Future<void> removeUser(int userId) {
    // TODO: implement removeUser
    throw UnimplementedError();
  }

  @override
  Future<void> setUser(User user) {
    // TODO: implement setUser
    throw UnimplementedError();
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

    isar.writeTxn((isar) async {
      await isar.userDatas.put(userData);
    });
  }

  @override
  Stream<List<User>> watchUsers() {
    // TODO: implement watchUsers
    throw UnimplementedError();
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
}
