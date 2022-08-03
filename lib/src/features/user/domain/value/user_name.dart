class UserName {
  UserName({required this.name}) {
    if (name.isEmpty) {
      throw Exception('no asset name');
    }
    if (name.length > 20) {
      throw Exception('too long name');
    }
  }
  String name;
}
