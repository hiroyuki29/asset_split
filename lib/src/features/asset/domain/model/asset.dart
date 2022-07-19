// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:asset_split/src/features/asset/domain/value/priod.dart';
import 'package:asset_split/src/features/user/domain/value/money_amount.dart';

import '../../data/collections/asset_data.dart';
import '../value/asset_name.dart';

class Asset {
  Asset({
    required this.id,
    required this.userId,
    required this.name,
    required this.image,
    required this.cost,
    required this.depreciationPriodOfDay,
    required this.purchaseDate,
    required this.repayment,
  });

  final int id;
  final int userId;
  final AssetName name;
  final Uint8List image;
  final Money cost;
  final Period depreciationPriodOfDay;
  final DateTime purchaseDate;
  final Money repayment;

  factory Asset.initCreate({
    required int userId,
    required AssetName name,
    required Uint8List image,
    required Money cost,
    required Period period,
  }) {
    return Asset(
        id: 0, //Isar保存時に採番するのでここでは０とする
        userId: userId,
        name: name,
        image: image,
        cost: cost,
        depreciationPriodOfDay: period,
        purchaseDate: DateTime.now(),
        repayment: Money(0));
  }

  factory Asset.fromAssetData(AssetData data) {
    return Asset(
      id: data.id,
      userId: data.userId,
      name: AssetName(assetName: data.name),
      image: data.image,
      cost: Money(data.cost),
      depreciationPriodOfDay: Period(data.depreciationPriodOfDay),
      purchaseDate: data.purchaseDate,
      repayment: Money(data.repayment),
    );
  }

  int daysUntillLimit() {
    DateTime finalDate =
        purchaseDate.add(Duration(days: depreciationPriodOfDay.amount));
    int remainingDays = finalDate.difference(DateTime.now()).inDays + 1;
    return remainingDays;
  }

  Money balanceAtNow() {
    if (cost.amount <= repayment.amount) {
      return Money(0);
    }
    return cost.decrease(repayment);
  }

  Money repaymentByDayForAsset() {
    int days = daysUntillLimit();
    Money balance = balanceAtNow();
    return balance.devide(days);
  }

  Asset copyWith({
    int? id,
    int? userId,
    AssetName? name,
    Uint8List? image,
    Money? cost,
    Period? depreciationPriodOfDay,
    DateTime? purchaseDate,
    Money? repayment,
  }) {
    return Asset(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      image: image ?? this.image,
      cost: cost ?? this.cost,
      depreciationPriodOfDay:
          depreciationPriodOfDay ?? this.depreciationPriodOfDay,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      repayment: repayment ?? this.repayment,
    );
  }

  @override
  String toString() {
    return 'Asset(id: $id, userId: $userId, name: $name, image: $image, cost: $cost, depreciationPriodOfMonth: $depreciationPriodOfDay, purchaseDate: $purchaseDate, repayment: $repayment)';
  }

  @override
  bool operator ==(covariant Asset other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.name == name &&
        other.image == image &&
        other.cost == cost &&
        other.depreciationPriodOfDay == depreciationPriodOfDay &&
        other.purchaseDate == purchaseDate &&
        other.repayment == repayment;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        name.hashCode ^
        image.hashCode ^
        cost.hashCode ^
        depreciationPriodOfDay.hashCode ^
        purchaseDate.hashCode ^
        repayment.hashCode;
  }
}

class AssetList {
  AssetList(this.list);

  List<Asset?> list;

  AssetList add(
    Asset asset,
  ) {
    list.add(asset);
    return AssetList(list);
  }

  void remove(int id) {
    if (list.isNotEmpty) {
      list.where((asset) => asset!.id != id).toList();
    }
  }

  Money sumAllCost() {
    Money sumAllCost = Money(0);
    if (list.isNotEmpty) {
      for (var asset in list) {
        Money addAmount = asset!.cost;
        sumAllCost = sumAllCost.add(addAmount);
      }
    }
    return sumAllCost;
  }

  Money sumRepaymentByDay() {
    Money sumAllRepaymentByDay = Money(0);
    if (list.isNotEmpty) {
      for (var asset in list) {
        Money addAmount = asset!.repaymentByDayForAsset();
        sumAllRepaymentByDay = sumAllRepaymentByDay.add(addAmount);
      }
    }
    return sumAllRepaymentByDay;
  }

  void reflectRepaymentForEachAsset(Money allRepayment) {
    Money baseAmount = sumRepaymentByDay();
    if (baseAmount.amount == 0) {
      return;
    }
    if (list.isNotEmpty) {
      list = [
        for (final asset in list)
          asset?.copyWith(
              repayment: asset.repayment.add(allRepayment
                  .multi(asset.repaymentByDayForAsset().ratio(baseAmount))))
      ];
    }
  }

  // AssetList selectAssets(int userId) {
  //   list = [
  //     for (final asset in list)
  //       if (asset!.userId == userId) asset,
  //   ];
  //   return AssetList(list);
  // }
}
