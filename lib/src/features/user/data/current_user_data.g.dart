// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetCurrentUserDataCollection on Isar {
  IsarCollection<CurrentUserData> get currentUserDatas => collection();
}

const CurrentUserDataSchema = CollectionSchema(
  name: r'CurrentUserData',
  schema:
      r'{"name":"CurrentUserData","idName":"id","properties":[{"name":"userId","type":"Long"}],"indexes":[],"links":[]}',
  idName: r'id',
  propertyIds: {r'userId': 0},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _currentUserDataGetId,
  setId: _currentUserDataSetId,
  getLinks: _currentUserDataGetLinks,
  attachLinks: _currentUserDataAttachLinks,
  serializeNative: _currentUserDataSerializeNative,
  deserializeNative: _currentUserDataDeserializeNative,
  deserializePropNative: _currentUserDataDeserializePropNative,
  serializeWeb: _currentUserDataSerializeWeb,
  deserializeWeb: _currentUserDataDeserializeWeb,
  deserializePropWeb: _currentUserDataDeserializePropWeb,
  version: 4,
);

int? _currentUserDataGetId(CurrentUserData object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _currentUserDataSetId(CurrentUserData object, int id) {
  object.id = id;
}

List<IsarLinkBase<dynamic>> _currentUserDataGetLinks(CurrentUserData object) {
  return [];
}

void _currentUserDataSerializeNative(
    IsarCollection<CurrentUserData> collection,
    IsarCObject cObj,
    CurrentUserData object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  final size = (staticSize) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
  writer.writeLong(offsets[0], object.userId);
}

CurrentUserData _currentUserDataDeserializeNative(
    IsarCollection<CurrentUserData> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = CurrentUserData();
  object.id = id;
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
      throw IsarError('Illegal propertyIndex');
  }
}

Object _currentUserDataSerializeWeb(
    IsarCollection<CurrentUserData> collection, CurrentUserData object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  IsarNative.jsObjectSet(jsObj, r'userId', object.userId);
  return jsObj;
}

CurrentUserData _currentUserDataDeserializeWeb(
    IsarCollection<CurrentUserData> collection, Object jsObj) {
  final object = CurrentUserData();
  object.id = IsarNative.jsObjectGet(jsObj, r'id');
  object.userId = IsarNative.jsObjectGet(jsObj, r'userId') ??
      (double.negativeInfinity as int);
  return object;
}

P _currentUserDataDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id')) as P;
    case r'userId':
      return (IsarNative.jsObjectGet(jsObj, r'userId') ??
          (double.negativeInfinity as int)) as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _currentUserDataAttachLinks(
    IsarCollection<dynamic> col, int id, CurrentUserData object) {}

extension CurrentUserDataQueryWhereSort
    on QueryBuilder<CurrentUserData, CurrentUserData, QWhere> {
  QueryBuilder<CurrentUserData, CurrentUserData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CurrentUserDataQueryWhere
    on QueryBuilder<CurrentUserData, CurrentUserData, QWhereClause> {
  QueryBuilder<CurrentUserData, CurrentUserData, QAfterWhereClause> idEqualTo(
      int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterWhereClause>
      idNotEqualTo(int id) {
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

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterWhereClause> idLessThan(
      int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterWhereClause> idBetween(
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

extension CurrentUserDataQueryFilter
    on QueryBuilder<CurrentUserData, CurrentUserData, QFilterCondition> {
  QueryBuilder<CurrentUserData, CurrentUserData, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterFilterCondition>
      idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterFilterCondition>
      userIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterFilterCondition>
      userIdGreaterThan(
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

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterFilterCondition>
      userIdLessThan(
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

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterFilterCondition>
      userIdBetween(
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

extension CurrentUserDataQueryLinks
    on QueryBuilder<CurrentUserData, CurrentUserData, QFilterCondition> {}

extension CurrentUserDataQueryWhereSortBy
    on QueryBuilder<CurrentUserData, CurrentUserData, QSortBy> {
  QueryBuilder<CurrentUserData, CurrentUserData, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension CurrentUserDataQueryWhereSortThenBy
    on QueryBuilder<CurrentUserData, CurrentUserData, QSortThenBy> {
  QueryBuilder<CurrentUserData, CurrentUserData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<CurrentUserData, CurrentUserData, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension CurrentUserDataQueryWhereDistinct
    on QueryBuilder<CurrentUserData, CurrentUserData, QDistinct> {
  QueryBuilder<CurrentUserData, CurrentUserData, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension CurrentUserDataQueryProperty
    on QueryBuilder<CurrentUserData, CurrentUserData, QQueryProperty> {
  QueryBuilder<CurrentUserData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CurrentUserData, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
