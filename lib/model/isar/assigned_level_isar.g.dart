// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_level_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarAssignedLevelCollection on Isar {
  IsarCollection<IsarAssignedLevel> get isarAssignedLevels => this.collection();
}

const IsarAssignedLevelSchema = CollectionSchema(
  name: r'IsarAssignedLevel',
  id: -5000828521066374043,
  properties: {
    r'assignedLevel': PropertySchema(
      id: 0,
      name: r'assignedLevel',
      type: IsarType.string,
    ),
    r'assignedLevelId': PropertySchema(
      id: 1,
      name: r'assignedLevelId',
      type: IsarType.long,
    ),
    r'geoJson': PropertySchema(
      id: 2,
      name: r'geoJson',
      type: IsarType.string,
    ),
    r'geoJsonLevel': PropertySchema(
      id: 3,
      name: r'geoJsonLevel',
      type: IsarType.string,
    ),
    r'geoJsonLevelCount': PropertySchema(
      id: 4,
      name: r'geoJsonLevelCount',
      type: IsarType.long,
    ),
    r'levelKey': PropertySchema(
      id: 5,
      name: r'levelKey',
      type: IsarType.string,
    ),
    r'levelName': PropertySchema(
      id: 6,
      name: r'levelName',
      type: IsarType.string,
    ),
    r'surveyLevel': PropertySchema(
      id: 7,
      name: r'surveyLevel',
      type: IsarType.string,
    ),
    r'surveyLevelCount': PropertySchema(
      id: 8,
      name: r'surveyLevelCount',
      type: IsarType.long,
    ),
    r'unitId': PropertySchema(
      id: 9,
      name: r'unitId',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 10,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _isarAssignedLevelEstimateSize,
  serialize: _isarAssignedLevelSerialize,
  deserialize: _isarAssignedLevelDeserialize,
  deserializeProp: _isarAssignedLevelDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _isarAssignedLevelGetId,
  getLinks: _isarAssignedLevelGetLinks,
  attach: _isarAssignedLevelAttach,
  version: '3.1.0+1',
);

int _isarAssignedLevelEstimateSize(
  IsarAssignedLevel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.assignedLevel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.geoJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.geoJsonLevel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.levelKey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.levelName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.surveyLevel;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unitId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarAssignedLevelSerialize(
  IsarAssignedLevel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.assignedLevel);
  writer.writeLong(offsets[1], object.assignedLevelId);
  writer.writeString(offsets[2], object.geoJson);
  writer.writeString(offsets[3], object.geoJsonLevel);
  writer.writeLong(offsets[4], object.geoJsonLevelCount);
  writer.writeString(offsets[5], object.levelKey);
  writer.writeString(offsets[6], object.levelName);
  writer.writeString(offsets[7], object.surveyLevel);
  writer.writeLong(offsets[8], object.surveyLevelCount);
  writer.writeString(offsets[9], object.unitId);
  writer.writeString(offsets[10], object.userId);
}

IsarAssignedLevel _isarAssignedLevelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarAssignedLevel();
  object.assignedLevel = reader.readStringOrNull(offsets[0]);
  object.assignedLevelId = reader.readLongOrNull(offsets[1]);
  object.geoJson = reader.readStringOrNull(offsets[2]);
  object.geoJsonLevel = reader.readStringOrNull(offsets[3]);
  object.geoJsonLevelCount = reader.readLongOrNull(offsets[4]);
  object.id = id;
  object.levelKey = reader.readStringOrNull(offsets[5]);
  object.levelName = reader.readStringOrNull(offsets[6]);
  object.surveyLevel = reader.readStringOrNull(offsets[7]);
  object.surveyLevelCount = reader.readLongOrNull(offsets[8]);
  object.unitId = reader.readStringOrNull(offsets[9]);
  object.userId = reader.readStringOrNull(offsets[10]);
  return object;
}

P _isarAssignedLevelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarAssignedLevelGetId(IsarAssignedLevel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarAssignedLevelGetLinks(
    IsarAssignedLevel object) {
  return [];
}

void _isarAssignedLevelAttach(
    IsarCollection<dynamic> col, Id id, IsarAssignedLevel object) {
  object.id = id;
}

extension IsarAssignedLevelQueryWhereSort
    on QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QWhere> {
  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterWhere> anyUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'userId'),
      );
    });
  }
}

extension IsarAssignedLevelQueryWhere
    on QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QWhereClause> {
  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
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

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterWhereClause>
      userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [null],
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterWhereClause>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterWhereClause>
      userIdEqualTo(String? userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterWhereClause>
      userIdNotEqualTo(String? userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterWhereClause>
      userIdGreaterThan(
    String? userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [userId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterWhereClause>
      userIdLessThan(
    String? userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [],
        upper: [userId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterWhereClause>
      userIdBetween(
    String? lowerUserId,
    String? upperUserId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [lowerUserId],
        includeLower: includeLower,
        upper: [upperUserId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterWhereClause>
      userIdStartsWith(String UserIdPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId',
        lower: [UserIdPrefix],
        upper: ['$UserIdPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterWhereClause>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId',
        value: [''],
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterWhereClause>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'userId',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'userId',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'userId',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'userId',
              upper: [''],
            ));
      }
    });
  }
}

extension IsarAssignedLevelQueryFilter
    on QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QFilterCondition> {
  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      assignedLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assignedLevel',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      assignedLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assignedLevel',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      assignedLevelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      assignedLevelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assignedLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      assignedLevelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assignedLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      assignedLevelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assignedLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      assignedLevelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assignedLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      assignedLevelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assignedLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      assignedLevelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assignedLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      assignedLevelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assignedLevel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      assignedLevelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      assignedLevelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assignedLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      assignedLevelIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assignedLevelId',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      assignedLevelIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assignedLevelId',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      assignedLevelIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedLevelId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      assignedLevelIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assignedLevelId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      assignedLevelIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assignedLevelId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      assignedLevelIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assignedLevelId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'geoJson',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'geoJson',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'geoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'geoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'geoJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'geoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'geoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'geoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'geoJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoJson',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'geoJson',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'geoJsonLevel',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'geoJsonLevel',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonLevelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoJsonLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonLevelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'geoJsonLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonLevelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'geoJsonLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonLevelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'geoJsonLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonLevelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'geoJsonLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonLevelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'geoJsonLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonLevelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'geoJsonLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonLevelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'geoJsonLevel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonLevelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoJsonLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonLevelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'geoJsonLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonLevelCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'geoJsonLevelCount',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonLevelCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'geoJsonLevelCount',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonLevelCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoJsonLevelCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonLevelCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'geoJsonLevelCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonLevelCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'geoJsonLevelCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      geoJsonLevelCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'geoJsonLevelCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
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

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      idLessThan(
    Id value, {
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

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'levelKey',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'levelKey',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelKeyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'levelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelKeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'levelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelKeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'levelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelKeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'levelKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'levelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'levelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'levelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'levelKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'levelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'levelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'levelName',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'levelName',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'levelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'levelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'levelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'levelName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'levelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'levelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'levelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'levelName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'levelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      levelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'levelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      surveyLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surveyLevel',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      surveyLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surveyLevel',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      surveyLevelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surveyLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      surveyLevelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surveyLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      surveyLevelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surveyLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      surveyLevelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surveyLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      surveyLevelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'surveyLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      surveyLevelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'surveyLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      surveyLevelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'surveyLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      surveyLevelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'surveyLevel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      surveyLevelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surveyLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      surveyLevelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'surveyLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      surveyLevelCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surveyLevelCount',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      surveyLevelCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surveyLevelCount',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      surveyLevelCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surveyLevelCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      surveyLevelCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surveyLevelCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      surveyLevelCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surveyLevelCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      surveyLevelCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surveyLevelCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      unitIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unitId',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      unitIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unitId',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      unitIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      unitIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      unitIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      unitIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      unitIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      unitIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      unitIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      unitIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      unitIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      unitIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      userIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      userIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      userIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      userIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension IsarAssignedLevelQueryObject
    on QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QFilterCondition> {}

extension IsarAssignedLevelQueryLinks
    on QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QFilterCondition> {}

extension IsarAssignedLevelQuerySortBy
    on QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QSortBy> {
  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortByAssignedLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevel', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortByAssignedLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevel', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortByAssignedLevelId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelId', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortByAssignedLevelIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelId', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortByGeoJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJson', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortByGeoJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJson', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortByGeoJsonLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevel', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortByGeoJsonLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevel', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortByGeoJsonLevelCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelCount', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortByGeoJsonLevelCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelCount', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortByLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortByLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortByLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelName', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortByLevelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelName', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortBySurveyLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevel', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortBySurveyLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevel', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortBySurveyLevelCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevelCount', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortBySurveyLevelCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevelCount', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortByUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortByUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension IsarAssignedLevelQuerySortThenBy
    on QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QSortThenBy> {
  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenByAssignedLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevel', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenByAssignedLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevel', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenByAssignedLevelId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelId', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenByAssignedLevelIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelId', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenByGeoJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJson', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenByGeoJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJson', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenByGeoJsonLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevel', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenByGeoJsonLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevel', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenByGeoJsonLevelCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelCount', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenByGeoJsonLevelCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelCount', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenByLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenByLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenByLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelName', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenByLevelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelName', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenBySurveyLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevel', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenBySurveyLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevel', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenBySurveyLevelCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevelCount', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenBySurveyLevelCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevelCount', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenByUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenByUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.desc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension IsarAssignedLevelQueryWhereDistinct
    on QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QDistinct> {
  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QDistinct>
      distinctByAssignedLevel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignedLevel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QDistinct>
      distinctByAssignedLevelId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignedLevelId');
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QDistinct>
      distinctByGeoJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'geoJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QDistinct>
      distinctByGeoJsonLevel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'geoJsonLevel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QDistinct>
      distinctByGeoJsonLevelCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'geoJsonLevelCount');
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QDistinct>
      distinctByLevelKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'levelKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QDistinct>
      distinctByLevelName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'levelName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QDistinct>
      distinctBySurveyLevel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surveyLevel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QDistinct>
      distinctBySurveyLevelCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surveyLevelCount');
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QDistinct>
      distinctByUnitId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension IsarAssignedLevelQueryProperty
    on QueryBuilder<IsarAssignedLevel, IsarAssignedLevel, QQueryProperty> {
  QueryBuilder<IsarAssignedLevel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarAssignedLevel, String?, QQueryOperations>
      assignedLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignedLevel');
    });
  }

  QueryBuilder<IsarAssignedLevel, int?, QQueryOperations>
      assignedLevelIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignedLevelId');
    });
  }

  QueryBuilder<IsarAssignedLevel, String?, QQueryOperations> geoJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'geoJson');
    });
  }

  QueryBuilder<IsarAssignedLevel, String?, QQueryOperations>
      geoJsonLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'geoJsonLevel');
    });
  }

  QueryBuilder<IsarAssignedLevel, int?, QQueryOperations>
      geoJsonLevelCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'geoJsonLevelCount');
    });
  }

  QueryBuilder<IsarAssignedLevel, String?, QQueryOperations>
      levelKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'levelKey');
    });
  }

  QueryBuilder<IsarAssignedLevel, String?, QQueryOperations>
      levelNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'levelName');
    });
  }

  QueryBuilder<IsarAssignedLevel, String?, QQueryOperations>
      surveyLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surveyLevel');
    });
  }

  QueryBuilder<IsarAssignedLevel, int?, QQueryOperations>
      surveyLevelCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surveyLevelCount');
    });
  }

  QueryBuilder<IsarAssignedLevel, String?, QQueryOperations> unitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitId');
    });
  }

  QueryBuilder<IsarAssignedLevel, String?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
