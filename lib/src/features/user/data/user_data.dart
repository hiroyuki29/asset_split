import 'package:isar/isar.dart';

part 'user_data.g.dart';

@Collection()
class UserData {
  int id = Isar.autoIncrement;
  late String name;
  late DateTime createDateTime;
  late double sumAmount;
  late double payBackAmount;
}
