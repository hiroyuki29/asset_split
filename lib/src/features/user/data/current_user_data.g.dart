// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetCurrentUserDataCollection on Isar {
  IsarCollection<CurrentUserData> get currentUserDatas => getCollection();
}

const CurrentUserDataSchema = CollectionSchema(
  name: 'CurrentUserData',
  schema:
      '{"name":"CurrentUserData","idName":"id","properties":[{"name":"userId","type":"Long"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'userId': 0},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _currentUserDataGetId,
  getLinks: _currentUserDataGetLinks,
  attachLinks: _currentUserDataAttachLinks,
  serializeNative: _currentUserDataSerializeNative,
  deserializeNative: _currentUserDataDeserializeNative,
  deserializePropNative: _currentUserDataDeserializePropNative,
  serializeWeb: _currentUserDataSerializeWeb,
  deserializeWeb: _currentUserDataDeserializeWeb,
  deserializePropWeb: _currentUserDataDeserializePropWeb,
  version: 3,
);

int? _currentUserDataGetId(CurrentUserData object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

List<IsarLinkBase> _currentUserDataGetLinks(CurrentUserData object) {
  return [];
}

void _currentUserDataSerializeNative(
    IsarCollection<CurrentUserData> collection,
    IsarRawObject rawObj,
    CurrentUserData object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.userId;
  final userId = value0;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], userId);
}

CurrentUserData _currentUserDataDeserializeNative(
    IsarCollection<CurrentUserData> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = CurrentUserData();
  object.userId = reader.readLong(offsets[0]);
  return object;
}

P _currentUserDataDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _currentUserDataSerializeWeb(
    IsarCollection<CurrentUserData> collection, CurrentUserData object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'userId', object.userId);
  return jsObj;
}

CurrentUserData _currentUserDataDeserializeWeb(
    IsarCollection<CurrentUserData> collection, dynamic jsObj) {
  final object = CurrentUserData();
  object.userId =
      IsarNative.jsObjectGet(jsObj, 'userId') ?? double.negativeInfinity;
  return object;
}

P _currentUserDataDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'userId':
      return (IsarNative.jsObjectGet(jsObj, 'userId') ??
          double.negativeInfinity) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _currentUserDataAttachLinks(
    IsarCollection col, int id, CurrentUserData object) {}

extension CurrentUserDataQueryWhereSort
    on QueryBuilder<CurrentUserData, CurrentUserData, QWhere> {
  QueryBuilder<CurrentUserData, CurrentUserData, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension CurrentUserDataQueryWhere
    on QueryBuilder<CurrentUserData, CurrentUserData, QWhereClause> {
  QueryBuilder<CurrentUserData, CurrentUserData, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterWhereClause>
      idNotEqualTo(int id) {
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

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterWhereClause> idLessThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterWhereClause> idBetween(
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

extension CurrentUserDataQueryFilter
    on QueryBuilder<CurrentUserData, CurrentUserData, QFilterCondition> {
  QueryBuilder<CurrentUserData, CurrentUserData, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterFilterCondition>
      userIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'userId',
      value: value,
    ));
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterFilterCondition>
      userIdGreaterThan(
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

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterFilterCondition>
      userIdLessThan(
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

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterFilterCondition>
      userIdBetween(
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

extension CurrentUserDataQueryLinks
    on QueryBuilder<CurrentUserData, CurrentUserData, QFilterCondition> {}

extension CurrentUserDataQueryWhereSortBy
    on QueryBuilder<CurrentUserData, CurrentUserData, QSortBy> {
  QueryBuilder<CurrentUserData, CurrentUserData, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterSortBy> sortByUserId() {
    return addSortByInternal('userId', Sort.asc);
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterSortBy>
      sortByUserIdDesc() {
    return addSortByInternal('userId', Sort.desc);
  }
}

extension CurrentUserDataQueryWhereSortThenBy
    on QueryBuilder<CurrentUserData, CurrentUserData, QSortThenBy> {
  QueryBuilder<CurrentUserData, CurrentUserData, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterSortBy> thenByUserId() {
    return addSortByInternal('userId', Sort.asc);
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterSortBy>
      thenByUserIdDesc() {
    return addSortByInternal('userId', Sort.desc);
  }
}

extension CurrentUserDataQueryWhereDistinct
    on QueryBuilder<CurrentUserData, CurrentUserData, QDistinct> {
  QueryBuilder<CurrentUserData, CurrentUserData, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QDistinct> distinctByUserId() {
    return addDistinctByInternal('userId');
  }
}

extension CurrentUserDataQueryProperty
    on QueryBuilder<CurrentUserData, CurrentUserData, QQueryProperty> {
  QueryBuilder<CurrentUserData, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<CurrentUserData, int, QQueryOperations> userIdProperty() {
    return addPropertyNameInternal('userId');
  }
}
