import 'package:isar/isar.dart';

part 'current_user_data.g.dart';

@Collection()
class CurrentUserData {
  int id = Isar.autoIncrement;
  late int userId;
}
