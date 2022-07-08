import 'dart:typed_data';

import 'package:isar/isar.dart';

part 'asset_data.g.dart';

@Collection()
class AssetData {
  int id = Isar.autoIncrement;

  late String name;
  late Uint8List image;
  late int cost;
  late int depreciationPriodOfMonth;
  late DateTime purchaseDate;
  late int repayment;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'cost': cost,
      'depreciationPriodOfMonth': depreciationPriodOfMonth,
      'purchaseDate': purchaseDate,
      'repayment': repayment,
    };
  }
}
