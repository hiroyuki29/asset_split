// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:asset_split/src/features/user/domain/value/money_amount.dart';

import '../../data/collections/asset_data.dart';
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

  factory Asset.initCreate({
    required AssetName name,
    required String imageUrl,
    required Money cost,
    required int priod,
  }) {
    return Asset(
        id: 0, //Isar保存時に採番するのでここでは０とする
        name: name,
        imageUrl: imageUrl,
        cost: cost,
        depreciationPriodOfMonth: priod,
        purchaseDate: DateTime.now(),
        repayment: Money(amount: 0));
  }

  factory Asset.fromAssetData(AssetData data) {
    return Asset(
      id: data.id,
      name: AssetName(assetName: data.name),
      imageUrl: data.imageUrl,
      cost: Money(amount: data.cost),
      depreciationPriodOfMonth: data.depreciationPriodOfMonth,
      purchaseDate: data.purchaseDate,
      repayment: Money(amount: data.repayment),
    );
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

  Money sumRepaymentByDay() {
    Money sumAllRepaymentByDay = Money(amount: 0);
    if (list.isNotEmpty) {
      for (var asset in list) {
        sumAllRepaymentByDay.add(asset!.repaymentByDayForAsset());
      }
    }
    return sumAllRepaymentByDay;
  }

  void reflectRepaymentForEachAsset(Money allRepayment) {
    Money baseAmount = sumRepaymentByDay();
    if (list.isNotEmpty) {
      list = [
        for (final asset in list)
          asset?.copyWith(
              repayment: asset.repayment.decrease(allRepayment
                  .multi(asset.repaymentByDayForAsset().ratio(baseAmount))))
      ];
    }
  }
}
