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
}
