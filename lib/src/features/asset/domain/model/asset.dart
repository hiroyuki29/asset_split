import 'package:asset_split/src/features/user/domain/value/money_amount.dart';

import '../value/asset_name.dart';

class Asset {
  Asset({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.cost,
    required this.depreciationPriodOfMonth,
    required this.purchaseDate,
    required this.repayment,
  });

  final int id;
  final AssetName name;
  final String imageUrl;
  final Money cost;
  final int depreciationPriodOfMonth;
  final DateTime purchaseDate;
  final Money repayment;
}
