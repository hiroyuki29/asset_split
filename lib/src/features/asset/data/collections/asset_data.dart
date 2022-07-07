import 'package:isar/isar.dart';

part 'asset_data.g.dart';

@Collection()
class AssetData {
  int id = Isar.autoIncrement;

  late String name;
  late String imageUrl;
  late int cost;
  late int depreciationPriodOfMonth;
  late DateTime purchaseDate;
  late int repayment;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'cost': cost,
      'depreciationPriodOfMonth': depreciationPriodOfMonth,
      'purchaseDate': purchaseDate,
      'repayment': repayment,
    };
  }
}
