import 'package:isar/isar.dart';

part 'current_user_data.g.dart';

@Collection()
class CurrentUserData {
  // final int id = Isar.autoIncrement;
  Id? id;
  late int userId;
}
