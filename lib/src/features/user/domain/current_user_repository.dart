abstract class CurrentUserRepository {
  // Stream<int> get currentUserDataStream;
  // int? get userId;
  Future<int> fetchCurrentUser();
  Future<void> select(int userId);
}
