// final currentUserRepositoryProvider = Provider<CurrentUserRepository>((ref) {
//   return CurrentUserRepositoryImpl();
// });

// final currentUserIdProvider = StreamProvider<int>((ref) {
//   final currentUserRepository = ref.watch(currentUserRepositoryProvider);
//   return currentUserRepository.currentUserId();
// });

abstract class CurrentUserRepository {
  Stream<int> currentUserId();
  void watchCurrentUser();
  Future<int> fetchCurrentUser();
  Future<void> select(int userId);
}
