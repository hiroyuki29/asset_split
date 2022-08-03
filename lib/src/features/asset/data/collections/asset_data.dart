import 'dart:typed_data';

import 'package:isar/isar.dart';

part 'asset_data.g.dart';

@Collection()
class AssetData {
  // final int id = Isar.autoIncrement;
  Id? id;
  late int userId;
  late String name;
  late Uint8List image;
  late double cost;
  late List<int> period;
  late DateTime purchaseDate;
  late double repayment;
}
