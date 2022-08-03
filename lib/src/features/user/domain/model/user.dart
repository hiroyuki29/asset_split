// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:asset_split/src/features/user/data/user_data.dart';
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

  final int id;
  final UserName name;
  final DateTime createDateTime;
  final Money sumAmount;
  final Money payBackAmount;

  factory User.initCreate({
    required UserName name,
  }) {
    return User(
      id: 0, //Isar保存時に採番するのでここでは０とする
      name: name,
      createDateTime: DateTime.now(),
      sumAmount: Money(0),
      payBackAmount: Money(0),
    );
  }

  factory User.fromUserData(UserData data) {
    return User(
      id: data.id!,
      name: UserName(name: data.name),
      createDateTime: data.createDateTime,
      sumAmount: Money(data.sumAmount),
      payBackAmount: Money(data.payBackAmount),
    );
  }

  User copyWith({
    int? id,
    UserName? name,
    DateTime? createDateTime,
    Money? sumAmount,
    Money? payBackAmount,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      createDateTime: createDateTime ?? this.createDateTime,
      sumAmount: sumAmount ?? this.sumAmount,
      payBackAmount: payBackAmount ?? this.payBackAmount,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, createDateTime: $createDateTime, sumAmount: $sumAmount, payBackAmount: $payBackAmount)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.createDateTime == createDateTime &&
        other.sumAmount == sumAmount &&
        other.payBackAmount == payBackAmount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        createDateTime.hashCode ^
        sumAmount.hashCode ^
        payBackAmount.hashCode;
  }
}
