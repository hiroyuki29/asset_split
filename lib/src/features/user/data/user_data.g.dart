// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetUserDataCollection on Isar {
  IsarCollection<UserData> get userDatas => collection();
}

const UserDataSchema = CollectionSchema(
  name: r'UserData',
  schema:
      r'{"name":"UserData","idName":"id","properties":[{"name":"createDateTime","type":"Long"},{"name":"name","type":"String"},{"name":"payBackAmount","type":"Double"},{"name":"sumAmount","type":"Double"}],"indexes":[],"links":[]}',
  idName: r'id',
  propertyIds: {
    r'createDateTime': 0,
    r'name': 1,
    r'payBackAmount': 2,
    r'sumAmount': 3
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _userDataGetId,
  setId: _userDataSetId,
  getLinks: _userDataGetLinks,
  attachLinks: _userDataAttachLinks,
  serializeNative: _userDataSerializeNative,
  deserializeNative: _userDataDeserializeNative,
  deserializePropNative: _userDataDeserializePropNative,
  serializeWeb: _userDataSerializeWeb,
  deserializeWeb: _userDataDeserializeWeb,
  deserializePropWeb: _userDataDeserializePropWeb,
  version: 4,
);

int? _userDataGetId(UserData object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _userDataSetId(UserData object, int id) {
  object.id = id;
}

List<IsarLinkBase<dynamic>> _userDataGetLinks(UserData object) {
  return [];
}

void _userDataSerializeNative(
    IsarCollection<UserData> collection,
    IsarCObject cObj,
    UserData object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  final name$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.name);
  final size = (staticSize + 3 + (name$Bytes.length)) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
  writer.writeDateTime(offsets[0], object.createDateTime);
  writer.writeByteList(offsets[1], name$Bytes);
  writer.writeDouble(offsets[2], object.payBackAmount);
  writer.writeDouble(offsets[3], object.sumAmount);
}

UserData _userDataDeserializeNative(IsarCollection<UserData> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = UserData();
  object.createDateTime = reader.readDateTime(offsets[0]);
  object.id = id;
  object.name = reader.readString(offsets[1]);
  object.payBackAmount = reader.readDouble(offsets[2]);
  object.sumAmount = reader.readDouble(offsets[3]);
  return object;
}

P _userDataDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Illegal propertyIndex');
  }
}

Object _userDataSerializeWeb(
    IsarCollection<UserData> collection, UserData object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, r'createDateTime',
      object.createDateTime.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  IsarNative.jsObjectSet(jsObj, r'name', object.name);
  IsarNative.jsObjectSet(jsObj, r'payBackAmount', object.payBackAmount);
  IsarNative.jsObjectSet(jsObj, r'sumAmount', object.sumAmount);
  return jsObj;
}

UserData _userDataDeserializeWeb(
    IsarCollection<UserData> collection, Object jsObj) {
  final object = UserData();
  object.createDateTime =
      IsarNative.jsObjectGet(jsObj, r'createDateTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, r'createDateTime') as int,
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0);
  object.id = IsarNative.jsObjectGet(jsObj, r'id');
  object.name = IsarNative.jsObjectGet(jsObj, r'name') ?? '';
  object.payBackAmount = IsarNative.jsObjectGet(jsObj, r'payBackAmount') ??
      double.negativeInfinity;
  object.sumAmount =
      IsarNative.jsObjectGet(jsObj, r'sumAmount') ?? double.negativeInfinity;
  return object;
}

P _userDataDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'createDateTime':
      return (IsarNative.jsObjectGet(jsObj, r'createDateTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, r'createDateTime') as int,
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id')) as P;
    case r'name':
      return (IsarNative.jsObjectGet(jsObj, r'name') ?? '') as P;
    case r'payBackAmount':
      return (IsarNative.jsObjectGet(jsObj, r'payBackAmount') ??
          double.negativeInfinity) as P;
    case r'sumAmount':
      return (IsarNative.jsObjectGet(jsObj, r'sumAmount') ??
          double.negativeInfinity) as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _userDataAttachLinks(
    IsarCollection<dynamic> col, int id, UserData object) {}

extension UserDataQueryWhereSort on QueryBuilder<UserData, UserData, QWhere> {
  QueryBuilder<UserData, UserData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserDataQueryWhere on QueryBuilder<UserData, UserData, QWhereClause> {
  QueryBuilder<UserData, UserData, QAfterWhereClause> idEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<UserData, UserData, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserData, UserData, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserData, UserData, QAfterWhereClause> idBetween(
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

extension UserDataQueryFilter
    on QueryBuilder<UserData, UserData, QFilterCondition> {
  QueryBuilder<UserData, UserData, QAfterFilterCondition> createDateTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition>
      createDateTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createDateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition>
      createDateTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createDateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> createDateTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createDateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameContains(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition>
      payBackAmountGreaterThan(double value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'payBackAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> payBackAmountLessThan(
      double value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        property: r'payBackAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> payBackAmountBetween(
      double lower, double upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'payBackAmount',
        lower: lower,
        includeLower: false,
        upper: upper,
        includeUpper: false,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> sumAmountGreaterThan(
      double value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sumAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> sumAmountLessThan(
      double value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        property: r'sumAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> sumAmountBetween(
      double lower, double upper) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sumAmount',
        lower: lower,
        includeLower: false,
        upper: upper,
        includeUpper: false,
      ));
    });
  }
}

extension UserDataQueryLinks
    on QueryBuilder<UserData, UserData, QFilterCondition> {}

extension UserDataQueryWhereSortBy
    on QueryBuilder<UserData, UserData, QSortBy> {
  QueryBuilder<UserData, UserData, QAfterSortBy> sortByCreateDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDateTime', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByCreateDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDateTime', Sort.desc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByPayBackAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payBackAmount', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByPayBackAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payBackAmount', Sort.desc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortBySumAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sumAmount', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortBySumAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sumAmount', Sort.desc);
    });
  }
}

extension UserDataQueryWhereSortThenBy
    on QueryBuilder<UserData, UserData, QSortThenBy> {
  QueryBuilder<UserData, UserData, QAfterSortBy> thenByCreateDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDateTime', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByCreateDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDateTime', Sort.desc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByPayBackAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payBackAmount', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByPayBackAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payBackAmount', Sort.desc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenBySumAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sumAmount', Sort.asc);
    });
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenBySumAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sumAmount', Sort.desc);
    });
  }
}

extension UserDataQueryWhereDistinct
    on QueryBuilder<UserData, UserData, QDistinct> {
  QueryBuilder<UserData, UserData, QDistinct> distinctByCreateDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDateTime');
    });
  }

  QueryBuilder<UserData, UserData, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserData, UserData, QDistinct> distinctByPayBackAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'payBackAmount');
    });
  }

  QueryBuilder<UserData, UserData, QDistinct> distinctBySumAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sumAmount');
    });
  }
}

extension UserDataQueryProperty
    on QueryBuilder<UserData, UserData, QQueryProperty> {
  QueryBuilder<UserData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserData, DateTime, QQueryOperations> createDateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDateTime');
    });
  }

  QueryBuilder<UserData, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<UserData, double, QQueryOperations> payBackAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'payBackAmount');
    });
  }

  QueryBuilder<UserData, double, QQueryOperations> sumAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sumAmount');
    });
  }
}
