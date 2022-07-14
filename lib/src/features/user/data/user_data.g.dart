// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetUserDataCollection on Isar {
  IsarCollection<UserData> get userDatas => getCollection();
}

const UserDataSchema = CollectionSchema(
  name: 'UserData',
  schema:
      '{"name":"UserData","idName":"id","properties":[{"name":"createDateTime","type":"Long"},{"name":"name","type":"String"},{"name":"payBackAmount","type":"Double"},{"name":"sumAmount","type":"Double"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'createDateTime': 0,
    'name': 1,
    'payBackAmount': 2,
    'sumAmount': 3
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
  version: 3,
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

List<IsarLinkBase> _userDataGetLinks(UserData object) {
  return [];
}

void _userDataSerializeNative(
    IsarCollection<UserData> collection,
    IsarRawObject rawObj,
    UserData object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.createDateTime;
  final _createDateTime = value0;
  final value1 = object.name;
  final _name = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_name.length) as int;
  final value2 = object.payBackAmount;
  final _payBackAmount = value2;
  final value3 = object.sumAmount;
  final _sumAmount = value3;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeDateTime(offsets[0], _createDateTime);
  writer.writeBytes(offsets[1], _name);
  writer.writeDouble(offsets[2], _payBackAmount);
  writer.writeDouble(offsets[3], _sumAmount);
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
      throw 'Illegal propertyIndex';
  }
}

dynamic _userDataSerializeWeb(
    IsarCollection<UserData> collection, UserData object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'createDateTime',
      object.createDateTime.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  IsarNative.jsObjectSet(jsObj, 'payBackAmount', object.payBackAmount);
  IsarNative.jsObjectSet(jsObj, 'sumAmount', object.sumAmount);
  return jsObj;
}

UserData _userDataDeserializeWeb(
    IsarCollection<UserData> collection, dynamic jsObj) {
  final object = UserData();
  object.createDateTime =
      IsarNative.jsObjectGet(jsObj, 'createDateTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'createDateTime'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0);
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.name = IsarNative.jsObjectGet(jsObj, 'name') ?? '';
  object.payBackAmount =
      IsarNative.jsObjectGet(jsObj, 'payBackAmount') ?? double.negativeInfinity;
  object.sumAmount =
      IsarNative.jsObjectGet(jsObj, 'sumAmount') ?? double.negativeInfinity;
  return object;
}

P _userDataDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'createDateTime':
      return (IsarNative.jsObjectGet(jsObj, 'createDateTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'createDateTime'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    case 'payBackAmount':
      return (IsarNative.jsObjectGet(jsObj, 'payBackAmount') ??
          double.negativeInfinity) as P;
    case 'sumAmount':
      return (IsarNative.jsObjectGet(jsObj, 'sumAmount') ??
          double.negativeInfinity) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _userDataAttachLinks(IsarCollection col, int id, UserData object) {}

extension UserDataQueryWhereSort on QueryBuilder<UserData, UserData, QWhere> {
  QueryBuilder<UserData, UserData, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension UserDataQueryWhere on QueryBuilder<UserData, UserData, QWhereClause> {
  QueryBuilder<UserData, UserData, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<UserData, UserData, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<UserData, UserData, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<UserData, UserData, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<UserData, UserData, QAfterWhereClause> idBetween(
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

extension UserDataQueryFilter
    on QueryBuilder<UserData, UserData, QFilterCondition> {
  QueryBuilder<UserData, UserData, QAfterFilterCondition> createDateTimeEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'createDateTime',
      value: value,
    ));
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition>
      createDateTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'createDateTime',
      value: value,
    ));
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition>
      createDateTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'createDateTime',
      value: value,
    ));
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> createDateTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'createDateTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition>
      payBackAmountGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'payBackAmount',
      value: value,
    ));
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> payBackAmountLessThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'payBackAmount',
      value: value,
    ));
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> payBackAmountBetween(
      double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'payBackAmount',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> sumAmountGreaterThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'sumAmount',
      value: value,
    ));
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> sumAmountLessThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'sumAmount',
      value: value,
    ));
  }

  QueryBuilder<UserData, UserData, QAfterFilterCondition> sumAmountBetween(
      double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sumAmount',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }
}

extension UserDataQueryLinks
    on QueryBuilder<UserData, UserData, QFilterCondition> {}

extension UserDataQueryWhereSortBy
    on QueryBuilder<UserData, UserData, QSortBy> {
  QueryBuilder<UserData, UserData, QAfterSortBy> sortByCreateDateTime() {
    return addSortByInternal('createDateTime', Sort.asc);
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByCreateDateTimeDesc() {
    return addSortByInternal('createDateTime', Sort.desc);
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByPayBackAmount() {
    return addSortByInternal('payBackAmount', Sort.asc);
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortByPayBackAmountDesc() {
    return addSortByInternal('payBackAmount', Sort.desc);
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortBySumAmount() {
    return addSortByInternal('sumAmount', Sort.asc);
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> sortBySumAmountDesc() {
    return addSortByInternal('sumAmount', Sort.desc);
  }
}

extension UserDataQueryWhereSortThenBy
    on QueryBuilder<UserData, UserData, QSortThenBy> {
  QueryBuilder<UserData, UserData, QAfterSortBy> thenByCreateDateTime() {
    return addSortByInternal('createDateTime', Sort.asc);
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByCreateDateTimeDesc() {
    return addSortByInternal('createDateTime', Sort.desc);
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByPayBackAmount() {
    return addSortByInternal('payBackAmount', Sort.asc);
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenByPayBackAmountDesc() {
    return addSortByInternal('payBackAmount', Sort.desc);
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenBySumAmount() {
    return addSortByInternal('sumAmount', Sort.asc);
  }

  QueryBuilder<UserData, UserData, QAfterSortBy> thenBySumAmountDesc() {
    return addSortByInternal('sumAmount', Sort.desc);
  }
}

extension UserDataQueryWhereDistinct
    on QueryBuilder<UserData, UserData, QDistinct> {
  QueryBuilder<UserData, UserData, QDistinct> distinctByCreateDateTime() {
    return addDistinctByInternal('createDateTime');
  }

  QueryBuilder<UserData, UserData, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<UserData, UserData, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<UserData, UserData, QDistinct> distinctByPayBackAmount() {
    return addDistinctByInternal('payBackAmount');
  }

  QueryBuilder<UserData, UserData, QDistinct> distinctBySumAmount() {
    return addDistinctByInternal('sumAmount');
  }
}

extension UserDataQueryProperty
    on QueryBuilder<UserData, UserData, QQueryProperty> {
  QueryBuilder<UserData, DateTime, QQueryOperations> createDateTimeProperty() {
    return addPropertyNameInternal('createDateTime');
  }

  QueryBuilder<UserData, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<UserData, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<UserData, double, QQueryOperations> payBackAmountProperty() {
    return addPropertyNameInternal('payBackAmount');
  }

  QueryBuilder<UserData, double, QQueryOperations> sumAmountProperty() {
    return addPropertyNameInternal('sumAmount');
  }
}
