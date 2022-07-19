import 'dart:async';

import 'package:asset_split/src/features/user/domain/current_user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final currentUserRepositoryProvider = Provider<CurrentUserRepository>((ref) {
  return CurrentUserRepositoryImpl();
});

final currentUserIdProvider = StreamProvider<int>((ref) {
  final currentUserRepository = ref.watch(currentUserRepositoryProvider);
  return currentUserRepository.currentUserId();
});

class CurrentUserRepositoryImpl implements CurrentUserRepository {
  CurrentUserRepositoryImpl();

  final _currentUserController = StreamController<int>.broadcast();

  @override
  Stream<int> currentUserId() => _currentUserController.stream;

  @override
  void watchCurrentUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? currentUserId = pref.getInt('currentUserId') ?? 0;
    _currentUserController.sink.add(currentUserId);
  }

  @override
  Future<int> fetchCurrentUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? currentUserId = pref.getInt('currentUserId') ?? 0;
    _currentUserController.sink.add(currentUserId);
    return currentUserId;
  }

  @override
  Future<void> select(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('currentUserId', userId);
    _currentUserController.sink.add(userId);
  }
}
