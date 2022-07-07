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
      '{"name":"AssetData","idName":"id","properties":[{"name":"cost","type":"Long"},{"name":"depreciationPriodOfMonth","type":"Long"},{"name":"imageUrl","type":"String"},{"name":"name","type":"String"},{"name":"purchaseDate","type":"Long"},{"name":"repayment","type":"Long"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'cost': 0,
    'depreciationPriodOfMonth': 1,
    'imageUrl': 2,
    'name': 3,
    'purchaseDate': 4,
    'repayment': 5
  },
  listProperties: {},
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
  final value1 = object.depreciationPriodOfMonth;
  final _depreciationPriodOfMonth = value1;
  final value2 = object.imageUrl;
  final _imageUrl = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_imageUrl.length) as int;
  final value3 = object.name;
  final _name = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_name.length) as int;
  final value4 = object.purchaseDate;
  final _purchaseDate = value4;
  final value5 = object.repayment;
  final _repayment = value5;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _cost);
  writer.writeLong(offsets[1], _depreciationPriodOfMonth);
  writer.writeBytes(offsets[2], _imageUrl);
  writer.writeBytes(offsets[3], _name);
  writer.writeDateTime(offsets[4], _purchaseDate);
  writer.writeLong(offsets[5], _repayment);
}

AssetData _assetDataDeserializeNative(IsarCollection<AssetData> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = AssetData();
  object.cost = reader.readLong(offsets[0]);
  object.depreciationPriodOfMonth = reader.readLong(offsets[1]);
  object.id = id;
  object.imageUrl = reader.readString(offsets[2]);
  object.name = reader.readString(offsets[3]);
  object.purchaseDate = reader.readDateTime(offsets[4]);
  object.repayment = reader.readLong(offsets[5]);
  return object;
}

P _assetDataDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _assetDataSerializeWeb(
    IsarCollection<AssetData> collection, AssetData object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'cost', object.cost);
  IsarNative.jsObjectSet(
      jsObj, 'depreciationPriodOfMonth', object.depreciationPriodOfMonth);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'imageUrl', object.imageUrl);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  IsarNative.jsObjectSet(jsObj, 'purchaseDate',
      object.purchaseDate.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'repayment', object.repayment);
  return jsObj;
}

AssetData _assetDataDeserializeWeb(
    IsarCollection<AssetData> collection, dynamic jsObj) {
  final object = AssetData();
  object.cost =
      IsarNative.jsObjectGet(jsObj, 'cost') ?? double.negativeInfinity;
  object.depreciationPriodOfMonth =
      IsarNative.jsObjectGet(jsObj, 'depreciationPriodOfMonth') ??
          double.negativeInfinity;
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.imageUrl = IsarNative.jsObjectGet(jsObj, 'imageUrl') ?? '';
  object.name = IsarNative.jsObjectGet(jsObj, 'name') ?? '';
  object.purchaseDate = IsarNative.jsObjectGet(jsObj, 'purchaseDate') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'purchaseDate'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.repayment =
      IsarNative.jsObjectGet(jsObj, 'repayment') ?? double.negativeInfinity;
  return object;
}

P _assetDataDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'cost':
      return (IsarNative.jsObjectGet(jsObj, 'cost') ?? double.negativeInfinity)
          as P;
    case 'depreciationPriodOfMonth':
      return (IsarNative.jsObjectGet(jsObj, 'depreciationPriodOfMonth') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'imageUrl':
      return (IsarNative.jsObjectGet(jsObj, 'imageUrl') ?? '') as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
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
  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> costEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'cost',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> costGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'cost',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> costLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'cost',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> costBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'cost',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition>
      depreciationPriodOfMonthEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'depreciationPriodOfMonth',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition>
      depreciationPriodOfMonthGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'depreciationPriodOfMonth',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition>
      depreciationPriodOfMonthLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'depreciationPriodOfMonth',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition>
      depreciationPriodOfMonthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'depreciationPriodOfMonth',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
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

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> imageUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'imageUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> imageUrlGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'imageUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> imageUrlLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'imageUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> imageUrlBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'imageUrl',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'imageUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'imageUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> imageUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'imageUrl',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> imageUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'imageUrl',
      value: pattern,
      caseSensitive: caseSensitive,
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

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> repaymentEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'repayment',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition>
      repaymentGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'repayment',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> repaymentLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'repayment',
      value: value,
    ));
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> repaymentBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'repayment',
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

  QueryBuilder<AssetData, AssetData, QAfterSortBy>
      sortByDepreciationPriodOfMonth() {
    return addSortByInternal('depreciationPriodOfMonth', Sort.asc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy>
      sortByDepreciationPriodOfMonthDesc() {
    return addSortByInternal('depreciationPriodOfMonth', Sort.desc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByImageUrl() {
    return addSortByInternal('imageUrl', Sort.asc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByImageUrlDesc() {
    return addSortByInternal('imageUrl', Sort.desc);
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
}

extension AssetDataQueryWhereSortThenBy
    on QueryBuilder<AssetData, AssetData, QSortThenBy> {
  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByCost() {
    return addSortByInternal('cost', Sort.asc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByCostDesc() {
    return addSortByInternal('cost', Sort.desc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy>
      thenByDepreciationPriodOfMonth() {
    return addSortByInternal('depreciationPriodOfMonth', Sort.asc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy>
      thenByDepreciationPriodOfMonthDesc() {
    return addSortByInternal('depreciationPriodOfMonth', Sort.desc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByImageUrl() {
    return addSortByInternal('imageUrl', Sort.asc);
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByImageUrlDesc() {
    return addSortByInternal('imageUrl', Sort.desc);
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
}

extension AssetDataQueryWhereDistinct
    on QueryBuilder<AssetData, AssetData, QDistinct> {
  QueryBuilder<AssetData, AssetData, QDistinct> distinctByCost() {
    return addDistinctByInternal('cost');
  }

  QueryBuilder<AssetData, AssetData, QDistinct>
      distinctByDepreciationPriodOfMonth() {
    return addDistinctByInternal('depreciationPriodOfMonth');
  }

  QueryBuilder<AssetData, AssetData, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<AssetData, AssetData, QDistinct> distinctByImageUrl(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('imageUrl', caseSensitive: caseSensitive);
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
}

extension AssetDataQueryProperty
    on QueryBuilder<AssetData, AssetData, QQueryProperty> {
  QueryBuilder<AssetData, int, QQueryOperations> costProperty() {
    return addPropertyNameInternal('cost');
  }

  QueryBuilder<AssetData, int, QQueryOperations>
      depreciationPriodOfMonthProperty() {
    return addPropertyNameInternal('depreciationPriodOfMonth');
  }

  QueryBuilder<AssetData, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<AssetData, String, QQueryOperations> imageUrlProperty() {
    return addPropertyNameInternal('imageUrl');
  }

  QueryBuilder<AssetData, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<AssetData, DateTime, QQueryOperations> purchaseDateProperty() {
    return addPropertyNameInternal('purchaseDate');
  }

  QueryBuilder<AssetData, int, QQueryOperations> repaymentProperty() {
    return addPropertyNameInternal('repayment');
  }
}