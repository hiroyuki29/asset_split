import 'package:asset_split/src/features/user/domain/value/money_amount.dart';

import '../value/user_name.dart';

class User {
  User({
    required this.id,
    required this.name,
    required this.createDateTime,
    required this.sumAmount,
    required this.payBackAmount,
  });

  final String id;
  final UserName name;
  final DateTime createDateTime;
  final Money sumAmount;
  final Money payBackAmount;
}
