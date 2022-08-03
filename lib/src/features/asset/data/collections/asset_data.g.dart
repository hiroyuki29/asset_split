// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetAssetDataCollection on Isar {
  IsarCollection<AssetData> get assetDatas => collection();
}

const AssetDataSchema = CollectionSchema(
  name: r'AssetData',
  schema:
      r'{"name":"AssetData","idName":"id","properties":[{"name":"cost","type":"Double"},{"name":"image","type":"ByteList"},{"name":"name","type":"String"},{"name":"period","type":"LongList"},{"name":"purchaseDate","type":"Long"},{"name":"repayment","type":"Double"},{"name":"userId","type":"Long"}],"indexes":[],"links":[]}',
  idName: r'id',
  propertyIds: {
    r'cost': 0,
    r'image': 1,
    r'name': 2,
    r'period': 3,
    r'purchaseDate': 4,
    r'repayment': 5,
    r'userId': 6
  },
  listProperties: {r'image', r'period'},
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
  version: 4,
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

List<IsarLinkBase<dynamic>> _assetDataGetLinks(AssetData object) {
  return [];
}

void _assetDataSerializeNative(
    IsarCollection<AssetData> collection,
    IsarCObject cObj,
    AssetData object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  final name$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.name);
  final size = (staticSize +
      3 +
      (object.image.length) +
      3 +
      (name$Bytes.length) +
      3 +
      (object.period.length) * 8) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
  writer.writeDouble(offsets[0], object.cost);
  writer.writeByteList(offsets[1], object.image);
  writer.writeByteList(offsets[2], name$Bytes);
  writer.writeLongList(offsets[3], object.period);
  writer.writeDateTime(offsets[4], object.purchaseDate);
  writer.writeDouble(offsets[5], object.repayment);
  writer.writeLong(offsets[6], object.userId);
}

AssetData _assetDataDeserializeNative(IsarCollection<AssetData> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = AssetData();
  object.cost = reader.readDouble(offsets[0]);
  object.id = id;
  object.image = reader.readByteList(offsets[1]);
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
      return (reader.readByteList(offset)) as P;
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
      throw IsarError('Illegal propertyIndex');
  }
}

Object _assetDataSerializeWeb(
    IsarCollection<AssetData> collection, AssetData object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, r'cost', object.cost);
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  IsarNative.jsObjectSet(jsObj, r'image', object.image);
  IsarNative.jsObjectSet(jsObj, r'name', object.name);
  IsarNative.jsObjectSet(jsObj, r'period', object.period);
  IsarNative.jsObjectSet(jsObj, r'purchaseDate',
      object.purchaseDate.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, r'repayment', object.repayment);
  IsarNative.jsObjectSet(jsObj, r'userId', object.userId);
  return jsObj;
}

AssetData _assetDataDeserializeWeb(
    IsarCollection<AssetData> collection, Object jsObj) {
  final object = AssetData();
  object.cost =
      IsarNative.jsObjectGet(jsObj, r'cost') ?? double.negativeInfinity;
  object.id = IsarNative.jsObjectGet(jsObj, r'id');
  object.image = IsarNative.jsObjectGet(jsObj, r'image') ?? Uint8List(0);
  object.name = IsarNative.jsObjectGet(jsObj, r'name') ?? '';
  object.period = (IsarNative.jsObjectGet(jsObj, r'period') as List?)
          ?.map((e) => e ?? (double.negativeInfinity as int))
          .toList()
          .cast<int>() ??
      [];
  object.purchaseDate = IsarNative.jsObjectGet(jsObj, r'purchaseDate') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, r'purchaseDate') as int,
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.repayment =
      IsarNative.jsObjectGet(jsObj, r'repayment') ?? double.negativeInfinity;
  object.userId = IsarNative.jsObjectGet(jsObj, r'userId') ??
      (double.negativeInfinity as int);
  return object;
}

P _assetDataDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'cost':
      return (IsarNative.jsObjectGet(jsObj, r'cost') ?? double.negativeInfinity)
          as P;
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id')) as P;
    case r'image':
      return (IsarNative.jsObjectGet(jsObj, r'image') ?? Uint8List(0)) as P;
    case r'name':
      return (IsarNative.jsObjectGet(jsObj, r'name') ?? '') as P;
    case r'period':
      return ((IsarNative.jsObjectGet(jsObj, r'period') as List?)
              ?.map((e) => e ?? (double.negativeInfinity as int))
              .toList()
              .cast<int>() ??
          []) as P;
    case r'purchaseDate':
      return (IsarNative.jsObjectGet(jsObj, r'purchaseDate') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, r'purchaseDate') as int,
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case r'repayment':
      return (IsarNative.jsObjectGet(jsObj, r'repayment') ??
          double.negativeInfinity) as P;
    case r'userId':
      return (IsarNative.jsObjectGet(jsObj, r'userId') ??
          (double.negativeInfinity as int)) as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _assetDataAttachLinks(
    IsarCollection<dynamic> col, int id, AssetData object) {}

extension AssetDataQueryWhereSort
    on QueryBuilder<AssetData, AssetData, QWhere> {
  QueryBuilder<AssetData, AssetData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AssetDataQueryWhere
    on QueryBuilder<AssetData, AssetData, QWhereClause> {
  QueryBuilder<AssetData, AssetData, QAfterWhereClause> idEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterWhereClause> idNotEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AssetDataQueryFilter
    on QueryBuilder<AssetData, AssetData, QFilterCondition> {
  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> costGreaterThan(
      double value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cost',
        value: value,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> costLessThan(
      double value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        property: r'cost',
        value: value,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> costBetween(
      double lower, double upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cost',
        lower: lower,
        includeLower: false,
        upper: upper,
        includeUpper: false,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> idEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition>
      periodElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'period',
        value: value,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition>
      periodElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'period',
        value: value,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition>
      periodElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'period',
        value: value,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition>
      periodElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'period',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> purchaseDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition>
      purchaseDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition>
      purchaseDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> purchaseDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchaseDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition>
      repaymentGreaterThan(double value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'repayment',
        value: value,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> repaymentLessThan(
      double value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        property: r'repayment',
        value: value,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> repaymentBetween(
      double lower, double upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'repayment',
        lower: lower,
        includeLower: false,
        upper: upper,
        includeUpper: false,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> userIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> userIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> userIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterFilterCondition> userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AssetDataQueryLinks
    on QueryBuilder<AssetData, AssetData, QFilterCondition> {}

extension AssetDataQueryWhereSortBy
    on QueryBuilder<AssetData, AssetData, QSortBy> {
  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.asc);
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.desc);
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.asc);
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByPurchaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.desc);
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByRepayment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repayment', Sort.asc);
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByRepaymentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repayment', Sort.desc);
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension AssetDataQueryWhereSortThenBy
    on QueryBuilder<AssetData, AssetData, QSortThenBy> {
  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.asc);
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.desc);
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.asc);
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByPurchaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.desc);
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByRepayment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repayment', Sort.asc);
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByRepaymentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repayment', Sort.desc);
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<AssetData, AssetData, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension AssetDataQueryWhereDistinct
    on QueryBuilder<AssetData, AssetData, QDistinct> {
  QueryBuilder<AssetData, AssetData, QDistinct> distinctByCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cost');
    });
  }

  QueryBuilder<AssetData, AssetData, QDistinct> distinctByImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'image');
    });
  }

  QueryBuilder<AssetData, AssetData, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AssetData, AssetData, QDistinct> distinctByPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'period');
    });
  }

  QueryBuilder<AssetData, AssetData, QDistinct> distinctByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchaseDate');
    });
  }

  QueryBuilder<AssetData, AssetData, QDistinct> distinctByRepayment() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'repayment');
    });
  }

  QueryBuilder<AssetData, AssetData, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension AssetDataQueryProperty
    on QueryBuilder<AssetData, AssetData, QQueryProperty> {
  QueryBuilder<AssetData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AssetData, double, QQueryOperations> costProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cost');
    });
  }

  QueryBuilder<AssetData, Uint8List, QQueryOperations> imageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'image');
    });
  }

  QueryBuilder<AssetData, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<AssetData, List<int>, QQueryOperations> periodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'period');
    });
  }

  QueryBuilder<AssetData, DateTime, QQueryOperations> purchaseDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchaseDate');
    });
  }

  QueryBuilder<AssetData, double, QQueryOperations> repaymentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'repayment');
    });
  }

  QueryBuilder<AssetData, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
