import 'package:isar/isar.dart';

part 'user_data.g.dart';

@Collection()
class UserData {
  // final int id = Isar.autoIncrement;
  Id? id;
  late String name;
  late DateTime createDateTime;
  late double sumAmount;
  late double payBackAmount;
}
