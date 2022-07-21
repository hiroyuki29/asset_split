import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/current_user_repository_impl.dart';
import 'model/user.dart';

final currentUserRepositoryProvider = Provider<CurrentUserRepository>((ref) {
  return CurrentUserRepositoryImpl();
});

final currentUserIdProvider = StreamProvider<User>((ref) {
  final currentUserRepository = ref.watch(currentUserRepositoryProvider);
  return currentUserRepository.currentUser();
});

abstract class CurrentUserRepository {
  Stream<User> currentUser();
  void watchCurrentUser();
  Future<int> fetchCurrentUser();
  Future<void> select(int userId);
}
