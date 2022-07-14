import 'dart:typed_data';

import 'package:isar/isar.dart';

import '../../../user/data/user_data.dart';

part 'asset_data.g.dart';

@Collection()
class AssetData {
  int id = Isar.autoIncrement;
  final user = IsarLink<UserData>();
  late String name;
  late Uint8List image;
  late double cost;
  late int depreciationPriodOfMonth;
  late DateTime purchaseDate;
  late double repayment;

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'userId': userId,
  //     'name': name,
  //     'image': image,
  //     'cost': cost,
  //     'depreciationPriodOfMonth': depreciationPriodOfMonth,
  //     'purchaseDate': purchaseDate,
  //     'repayment': repayment,
  //   };
  // }
}
