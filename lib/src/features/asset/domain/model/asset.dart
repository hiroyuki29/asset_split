// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  factory Asset.initCreate(
    int id,
    AssetName name,
    String imageUrl,
    Money cost,
    int priod,
  ) {
    return Asset(
        id: id,
        name: name,
        imageUrl: imageUrl,
        cost: cost,
        depreciationPriodOfMonth: priod,
        purchaseDate: DateTime.now(),
        repayment: Money(amount: 0));
  }

  int daysUntillLimit() {
    DateTime finalDate =
        purchaseDate.add(Duration(days: depreciationPriodOfMonth));
    return DateTime.now().difference(finalDate).inDays;
  }

  Money balanceAtNow() {
    return cost.decrease(repayment);
  }

  Money repaymentByDayForAsset() {
    return balanceAtNow().devide(daysUntillLimit());
  }

  Asset copyWith({
    int? id,
    AssetName? name,
    String? imageUrl,
    Money? cost,
    int? depreciationPriodOfMonth,
    DateTime? purchaseDate,
    Money? repayment,
  }) {
    return Asset(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      cost: cost ?? this.cost,
      depreciationPriodOfMonth:
          depreciationPriodOfMonth ?? this.depreciationPriodOfMonth,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      repayment: repayment ?? this.repayment,
    );
  }

  @override
  String toString() {
    return 'Asset(id: $id, name: $name, imageUrl: $imageUrl, cost: $cost, depreciationPriodOfMonth: $depreciationPriodOfMonth, purchaseDate: $purchaseDate, repayment: $repayment)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Asset &&
        other.id == id &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.cost == cost &&
        other.depreciationPriodOfMonth == depreciationPriodOfMonth &&
        other.purchaseDate == purchaseDate &&
        other.repayment == repayment;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        imageUrl.hashCode ^
        cost.hashCode ^
        depreciationPriodOfMonth.hashCode ^
        purchaseDate.hashCode ^
        repayment.hashCode;
  }
}

class AssetList {
  AssetList(this.assetList);

  List<Asset?> assetList;

  AssetList add(
    int id,
    AssetName name,
    String url,
    Money cost,
    int priod,
  ) {
    assetList.add(Asset(
        id: id,
        name: name,
        imageUrl: url,
        cost: cost,
        depreciationPriodOfMonth: priod,
        purchaseDate: DateTime.now(),
        repayment: Money(amount: 0)));
    return AssetList(assetList);
  }

  void remove(int id) {
    if (assetList.isNotEmpty) {
      assetList.where((asset) => asset!.id != id).toList();
    }
  }

  Money sumRepaymentByDay() {
    Money sumAllRepaymentByDay = Money(amount: 0);
    if (assetList.isNotEmpty) {
      for (var asset in assetList) {
        sumAllRepaymentByDay.add(asset!.repaymentByDayForAsset());
      }
    }
    return sumAllRepaymentByDay;
  }

  void reflectRepaymentForEachAsset(Money allRepayment) {
    Money baseAmount = sumRepaymentByDay();
    if (assetList.isNotEmpty) {
      assetList = [
        for (final asset in assetList)
          asset?.copyWith(
              repayment: asset.repayment.decrease(allRepayment
                  .multi(asset.repaymentByDayForAsset().ratio(baseAmount))))
      ];
    }
  }
}
