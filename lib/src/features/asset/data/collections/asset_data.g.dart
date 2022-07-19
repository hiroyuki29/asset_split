// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetAssetDataCollection on Isar {
  IsarCollection<AssetData> get assetDatas => getCollection();
}

const AssetDataSchema = CollectionSchema(
  name: 'AssetData',
  schema:
      '{"name":"AssetData","idName":"id","properties":[{"name":"cost","type":"Double"},{"name":"image","type":"ByteList"},{"name":"name","type":"String"},{"name":"period","type":"LongList"},{"name":"purchaseDate","type":"Long"},{"name":"repayment","type":"Double"},{"name":"userId","type":"Long"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'cost': 0,
    'image': 1,
    'name': 2,
    'period': 3,
    'purchaseDate': 4,
    'repayment': 5,
    'userId': 6
  },
  listProperties: {'image', 'period'},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _assetDataGetId,
  setId: _assetDataSetId,
  getLinks: _assetDataGetLinks,
  attachLinks: _assetDataAttachLinks,
  serializeNative: _assetDataSerializeNative,
  deserializeNative: _assetDataDeserializeNative,
  deserializePropNative: _assetDataDeserializePropNative,
  serializeWeb: _assetDataSerializeWeb,
  deserializeWeb: _assetDataDeserializeWeb,
  deserializePropWeb: _assetDataDeserializePropWeb,
  version: 3,
);

int? _assetDataGetId(AssetData object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _assetDataSetId(AssetData object, int id) {
  object.id = id;
}

List<IsarLinkBase> _assetDataGetLinks(AssetData object) {
  return [];
}

void _assetDataSerializeNative(
    IsarCollection<AssetData> collection,
    IsarRawObject rawObj,
    AssetData object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.cost;
  final _cost = value0;
  final value1 = object.image;
  dynamicSize += (value1.length) * 1;
  final _image = value1;
  final value2 = object.name;
  final _name = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_name.length) as int;
  final value3 = object.period;
  dynamicSize += (value3.length) * 8;
  final _period = value3;
  final value4 = object.purchaseDate;
  final _purchaseDate = value4;
  final value5 = object.repayment;
  final _repayment = value5;
  final value6 = object.userId;
  final _userId = value6;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeDouble(offsets[0], _cost);
  writer.writeBytes(offsets[1], _image);
  writer.writeBytes(offsets[2], _name);
  writer.writeLongList(offsets[3], _period);
  writer.writeDateTime(offsets[4], _purchaseDate);
  writer.writeDouble(offsets[5], _repayment);
  writer.writeLong(offsets[6], _userId);
}

AssetData _assetDataDeserializeNative(IsarCollection<AssetData> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = AssetData();
  object.cost = reader.readDouble(offsets[0]);
  object.id = id;
  object.image = reader.readBytes(offsets[1]);
  object.name = reader.readString(offsets[2]);
  object.period = reader.readLongList(offsets[3]) ?? [];
  object.purchaseDate = reader.readDateTime(offsets[4]);
  object.repayment = reader.readDouble(offsets[5]);
  object.userId = reader.readLong(offsets[6]);
  return object;
}

P _assetDataDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readBytes(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLongList(offset) ?? []) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _assetDataSerializeWeb(
    IsarCollection<AssetData> collection, AssetData object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'cost', object.cost);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'image', object.image);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  IsarNative.jsObjectSet(jsObj, 'period', object.period);
  IsarNative.jsObjectSet(jsObj, 'purchaseDate',
      object.purchaseDate.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'repayment', object.repayment);
  IsarNative.jsObjectSet(jsObj, 'userId', object.userId);
  return jsObj;
}

AssetData _assetDataDeserializeWeb(
    IsarCollection<AssetData> collection, dynamic jsObj) {
  final object = AssetData();
  object.cost =
      IsarNative.jsObjectGet(jsObj, 'cost') ?? double.negativeInfinity;
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.image = IsarNative.jsObjectGet(jsObj, 'image') ?? Uint8List(0);
  object.name = IsarNative.jsObjectGet(jsObj, 'name') ?? '';
  object.period = (IsarNative.jsObjectGet(jsObj, 'period') as List?)
          ?.map((e) => e ?? double.negativeInfinity)
          .toList()
          .cast<int>() ??
      [];
  object.purchaseDate = IsarNative.jsObjectGet(jsObj, 'purchaseDate') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'purchaseDate'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.repayment =
      IsarNative.jsObjectGet(jsObj, 'repayment') ?? double.negativeInfinity;
  object.userId =
      IsarNative.jsObjectGet(jsObj, 'userId') ?? double.negativeInfinity;
  return object;
}

P _assetDataDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'cost':
      return (IsarNative.jsObjectGet(jsObj, 'cost') ?? double.negativeInfinity)
          as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'image':
      return (IsarNative.jsObjectGet(jsObj, 'image') ?? Uint8List(0)) as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    case 'period':
      return ((IsarNative.jsObjectGet(jsObj, 'period') as List?)
              ?.map((e) => e ?? double.negativeInfinity)
              .toList()
              .cast<int>() ??
          []) as P;
    case 'purchaseDate':
      return (IsarNative.jsObjectGet(jsObj, 'purchaseDate') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'purchaseDate'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'repayment':
      return (IsarNative.jsObjectGet(jsObj, 'repayment') ??
          double.negativeInfinity) as P;
    case 'userId':
      return (IsarNative.jsObjectGet(jsObj, 'userId') ??
          double.negativeInfinity) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _assetDataAttachLinks(IsarCollection col, int id, AssetData object) {}

extension AssetDataQueryWhereSort
    on QueryBuilder<AssetData, AssetData, QWhere> {
  QueryBuilder<AssetData, AssetData, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension AssetDataQueryWhere
    on QueryBuilder<AssetData, AssetData, QWhereClause> {
  QueryBuilder<AssetData, AssetData, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<AssetData, AssetData, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<AssetData, AssetData, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<AssetData, AssetData, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension AssetDataQueryFilter
    on QueryBuilder<AssetData, AssetData, QFilterCondition> {
  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> costGreaterThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'cost',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> costLessThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'cost',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> costBetween(
      double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'cost',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> periodAnyEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'period',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition>
      periodAnyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'period',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> periodAnyLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'period',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> periodAnyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'period',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> purchaseDateEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'purchaseDate',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition>
      purchaseDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'purchaseDate',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition>
      purchaseDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'purchaseDate',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> purchaseDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'purchaseDate',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition>
      repaymentGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'repayment',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> repaymentLessThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'repayment',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> repaymentBetween(
      double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'repayment',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> userIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'userId',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> userIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'userId',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> userIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'userId',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'userId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension AssetDataQueryLinks
    on QueryBuilder<AssetData, AssetData, QFilterCondition> {}

extension AssetDataQueryWhereSortBy
    on QueryBuilder<AssetData, AssetData, QSortBy> {
  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByCost() {
    return addSortByInternal('cost', Sort.asc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByCostDesc() {
    return addSortByInternal('cost', Sort.desc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByPurchaseDate() {
    return addSortByInternal('purchaseDate', Sort.asc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByPurchaseDateDesc() {
    return addSortByInternal('purchaseDate', Sort.desc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByRepayment() {
    return addSortByInternal('repayment', Sort.asc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByRepaymentDesc() {
    return addSortByInternal('repayment', Sort.desc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByUserId() {
    return addSortByInternal('userId', Sort.asc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByUserIdDesc() {
    return addSortByInternal('userId', Sort.desc);
  }
}

extension AssetDataQueryWhereSortThenBy
    on QueryBuilder<AssetData, AssetData, QSortThenBy> {
  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByCost() {
    return addSortByInternal('cost', Sort.asc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByCostDesc() {
    return addSortByInternal('cost', Sort.desc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByPurchaseDate() {
    return addSortByInternal('purchaseDate', Sort.asc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByPurchaseDateDesc() {
    return addSortByInternal('purchaseDate', Sort.desc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByRepayment() {
    return addSortByInternal('repayment', Sort.asc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByRepaymentDesc() {
    return addSortByInternal('repayment', Sort.desc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByUserId() {
    return addSortByInternal('userId', Sort.asc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByUserIdDesc() {
    return addSortByInternal('userId', Sort.desc);
  }
}

extension AssetDataQueryWhereDistinct
    on QueryBuilder<AssetData, AssetData, QDistinct> {
  QueryBuilder<AssetData, AssetData, QDistinct> distinctByCost() {
    return addDistinctByInternal('cost');
  }

  QueryBuilder<AssetData, AssetData, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<AssetData, AssetData, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<AssetData, AssetData, QDistinct> distinctByPurchaseDate() {
    return addDistinctByInternal('purchaseDate');
  }

  QueryBuilder<AssetData, AssetData, QDistinct> distinctByRepayment() {
    return addDistinctByInternal('repayment');
  }

  QueryBuilder<AssetData, AssetData, QDistinct> distinctByUserId() {
    return addDistinctByInternal('userId');
  }
}

extension AssetDataQueryProperty
    on QueryBuilder<AssetData, AssetData, QQueryProperty> {
  QueryBuilder<AssetData, double, QQueryOperations> costProperty() {
    return addPropertyNameInternal('cost');
  }

  QueryBuilder<AssetData, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<AssetData, Uint8List, QQueryOperations> imageProperty() {
    return addPropertyNameInternal('image');
  }

  QueryBuilder<AssetData, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<AssetData, List<int>, QQueryOperations> periodProperty() {
    return addPropertyNameInternal('period');
  }

  QueryBuilder<AssetData, DateTime, QQueryOperations> purchaseDateProperty() {
    return addPropertyNameInternal('purchaseDate');
  }

  QueryBuilder<AssetData, double, QQueryOperations> repaymentProperty() {
    return addPropertyNameInternal('repayment');
  }

  QueryBuilder<AssetData, int, QQueryOperations> userIdProperty() {
    return addPropertyNameInternal('userId');
  }
}
