abstract class CurrentUserRepository {
  Stream<int> currentUserId();
  // int? get userId;
  void watchCurrentUser();
  Future<int> fetchCurrentUser();
  Future<void> select(int userId);
}
