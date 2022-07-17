import 'dart:async';

import 'package:asset_split/src/features/user/domain/current_user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final currentUserRepositoryProvider =
    Provider.autoDispose<CurrentUserRepository>((ref) {
  return CurrentUserRepositoryImpl();
});

class CurrentUserRepositoryImpl implements CurrentUserRepository {
  CurrentUserRepositoryImpl();

  @override
  Future<int> fetchCurrentUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? currentUserId = pref.getInt('currentUserId') ?? 0;
    return currentUserId;
  }

  @override
  Future<void> select(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('currentUserId', userId);
  }
}
