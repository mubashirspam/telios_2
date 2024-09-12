// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_level_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarMapLevelModelCollection on Isar {
  IsarCollection<IsarMapLevelModel> get isarMapLevelModels => this.collection();
}

const IsarMapLevelModelSchema = CollectionSchema(
  name: r'IsarMapLevelModel',
  id: 8709916675850699487,
  properties: {
    r'assignedLevelKey': PropertySchema(
      id: 0,
      name: r'assignedLevelKey',
      type: IsarType.string,
    ),
    r'assignedLevelName': PropertySchema(
      id: 1,
      name: r'assignedLevelName',
      type: IsarType.string,
    ),
    r'levels': PropertySchema(
      id: 2,
      name: r'levels',
      type: IsarType.objectList,
      target: r'IsarMapLevel',
    )
  },
  estimateSize: _isarMapLevelModelEstimateSize,
  serialize: _isarMapLevelModelSerialize,
  deserialize: _isarMapLevelModelDeserialize,
  deserializeProp: _isarMapLevelModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'assignedLevelKey': IndexSchema(
      id: -5308329231732887189,
      name: r'assignedLevelKey',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'assignedLevelKey',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'IsarMapLevel': IsarMapLevelSchema},
  getId: _isarMapLevelModelGetId,
  getLinks: _isarMapLevelModelGetLinks,
  attach: _isarMapLevelModelAttach,
  version: '3.1.0+1',
);

int _isarMapLevelModelEstimateSize(
  IsarMapLevelModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.assignedLevelKey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.assignedLevelName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.levels;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[IsarMapLevel]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              IsarMapLevelSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _isarMapLevelModelSerialize(
  IsarMapLevelModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.assignedLevelKey);
  writer.writeString(offsets[1], object.assignedLevelName);
  writer.writeObjectList<IsarMapLevel>(
    offsets[2],
    allOffsets,
    IsarMapLevelSchema.serialize,
    object.levels,
  );
}

IsarMapLevelModel _isarMapLevelModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarMapLevelModel(
    assignedLevelKey: reader.readStringOrNull(offsets[0]),
    assignedLevelName: reader.readStringOrNull(offsets[1]),
    id: id,
    levels: reader.readObjectList<IsarMapLevel>(
      offsets[2],
      IsarMapLevelSchema.deserialize,
      allOffsets,
      IsarMapLevel(),
    ),
  );
  return object;
}

P _isarMapLevelModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readObjectList<IsarMapLevel>(
        offset,
        IsarMapLevelSchema.deserialize,
        allOffsets,
        IsarMapLevel(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarMapLevelModelGetId(IsarMapLevelModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarMapLevelModelGetLinks(
    IsarMapLevelModel object) {
  return [];
}

void _isarMapLevelModelAttach(
    IsarCollection<dynamic> col, Id id, IsarMapLevelModel object) {
  object.id = id;
}

extension IsarMapLevelModelQueryWhereSort
    on QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QWhere> {
  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterWhere>
      anyAssignedLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'assignedLevelKey'),
      );
    });
  }
}

extension IsarMapLevelModelQueryWhere
    on QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QWhereClause> {
  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterWhereClause>
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

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterWhereClause>
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

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterWhereClause>
      assignedLevelKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'assignedLevelKey',
        value: [null],
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterWhereClause>
      assignedLevelKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'assignedLevelKey',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterWhereClause>
      assignedLevelKeyEqualTo(String? assignedLevelKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'assignedLevelKey',
        value: [assignedLevelKey],
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterWhereClause>
      assignedLevelKeyNotEqualTo(String? assignedLevelKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'assignedLevelKey',
              lower: [],
              upper: [assignedLevelKey],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'assignedLevelKey',
              lower: [assignedLevelKey],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'assignedLevelKey',
              lower: [assignedLevelKey],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'assignedLevelKey',
              lower: [],
              upper: [assignedLevelKey],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterWhereClause>
      assignedLevelKeyGreaterThan(
    String? assignedLevelKey, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'assignedLevelKey',
        lower: [assignedLevelKey],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterWhereClause>
      assignedLevelKeyLessThan(
    String? assignedLevelKey, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'assignedLevelKey',
        lower: [],
        upper: [assignedLevelKey],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterWhereClause>
      assignedLevelKeyBetween(
    String? lowerAssignedLevelKey,
    String? upperAssignedLevelKey, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'assignedLevelKey',
        lower: [lowerAssignedLevelKey],
        includeLower: includeLower,
        upper: [upperAssignedLevelKey],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterWhereClause>
      assignedLevelKeyStartsWith(String AssignedLevelKeyPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'assignedLevelKey',
        lower: [AssignedLevelKeyPrefix],
        upper: ['$AssignedLevelKeyPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterWhereClause>
      assignedLevelKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'assignedLevelKey',
        value: [''],
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterWhereClause>
      assignedLevelKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'assignedLevelKey',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'assignedLevelKey',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'assignedLevelKey',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'assignedLevelKey',
              upper: [''],
            ));
      }
    });
  }
}

extension IsarMapLevelModelQueryFilter
    on QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QFilterCondition> {
  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assignedLevelKey',
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assignedLevelKey',
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelKeyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelKeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assignedLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelKeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assignedLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelKeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assignedLevelKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assignedLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assignedLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assignedLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assignedLevelKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedLevelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assignedLevelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assignedLevelName',
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assignedLevelName',
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assignedLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assignedLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assignedLevelName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assignedLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assignedLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assignedLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assignedLevelName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedLevelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      assignedLevelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assignedLevelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      levelsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'levels',
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      levelsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'levels',
      ));
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      levelsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'levels',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      levelsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'levels',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      levelsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'levels',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      levelsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'levels',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      levelsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'levels',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      levelsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'levels',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension IsarMapLevelModelQueryObject
    on QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QFilterCondition> {
  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterFilterCondition>
      levelsElement(FilterQuery<IsarMapLevel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'levels');
    });
  }
}

extension IsarMapLevelModelQueryLinks
    on QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QFilterCondition> {}

extension IsarMapLevelModelQuerySortBy
    on QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QSortBy> {
  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterSortBy>
      sortByAssignedLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterSortBy>
      sortByAssignedLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterSortBy>
      sortByAssignedLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelName', Sort.asc);
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterSortBy>
      sortByAssignedLevelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelName', Sort.desc);
    });
  }
}

extension IsarMapLevelModelQuerySortThenBy
    on QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QSortThenBy> {
  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterSortBy>
      thenByAssignedLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterSortBy>
      thenByAssignedLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterSortBy>
      thenByAssignedLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelName', Sort.asc);
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterSortBy>
      thenByAssignedLevelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelName', Sort.desc);
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension IsarMapLevelModelQueryWhereDistinct
    on QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QDistinct> {
  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QDistinct>
      distinctByAssignedLevelKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignedLevelKey',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QDistinct>
      distinctByAssignedLevelName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignedLevelName',
          caseSensitive: caseSensitive);
    });
  }
}

extension IsarMapLevelModelQueryProperty
    on QueryBuilder<IsarMapLevelModel, IsarMapLevelModel, QQueryProperty> {
  QueryBuilder<IsarMapLevelModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarMapLevelModel, String?, QQueryOperations>
      assignedLevelKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignedLevelKey');
    });
  }

  QueryBuilder<IsarMapLevelModel, String?, QQueryOperations>
      assignedLevelNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignedLevelName');
    });
  }

  QueryBuilder<IsarMapLevelModel, List<IsarMapLevel>?, QQueryOperations>
      levelsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'levels');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IsarMapLevelSchema = Schema(
  name: r'IsarMapLevel',
  id: 6310100877837237007,
  properties: {
    r'geoJson': PropertySchema(
      id: 0,
      name: r'geoJson',
      type: IsarType.string,
    ),
    r'levelKey': PropertySchema(
      id: 1,
      name: r'levelKey',
      type: IsarType.string,
    ),
    r'levelName': PropertySchema(
      id: 2,
      name: r'levelName',
      type: IsarType.string,
    ),
    r'surveyLevelCount': PropertySchema(
      id: 3,
      name: r'surveyLevelCount',
      type: IsarType.long,
    )
  },
  estimateSize: _isarMapLevelEstimateSize,
  serialize: _isarMapLevelSerialize,
  deserialize: _isarMapLevelDeserialize,
  deserializeProp: _isarMapLevelDeserializeProp,
);

int _isarMapLevelEstimateSize(
  IsarMapLevel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.geoJson;
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
  return bytesCount;
}

void _isarMapLevelSerialize(
  IsarMapLevel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.geoJson);
  writer.writeString(offsets[1], object.levelKey);
  writer.writeString(offsets[2], object.levelName);
  writer.writeLong(offsets[3], object.surveyLevelCount);
}

IsarMapLevel _isarMapLevelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarMapLevel(
    geoJson: reader.readStringOrNull(offsets[0]),
    levelKey: reader.readStringOrNull(offsets[1]),
    levelName: reader.readStringOrNull(offsets[2]),
    surveyLevelCount: reader.readLongOrNull(offsets[3]),
  );
  return object;
}

P _isarMapLevelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarMapLevelQueryFilter
    on QueryBuilder<IsarMapLevel, IsarMapLevel, QFilterCondition> {
  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      geoJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'geoJson',
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      geoJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'geoJson',
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      geoJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'geoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      geoJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'geoJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      geoJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoJson',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      geoJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'geoJson',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      levelKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'levelKey',
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      levelKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'levelKey',
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      levelKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'levelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      levelKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'levelKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      levelKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'levelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      levelKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'levelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      levelNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'levelName',
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      levelNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'levelName',
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      levelNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'levelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      levelNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'levelName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      levelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'levelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      levelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'levelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      surveyLevelCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surveyLevelCount',
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      surveyLevelCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surveyLevelCount',
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
      surveyLevelCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surveyLevelCount',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarMapLevel, IsarMapLevel, QAfterFilterCondition>
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
}

extension IsarMapLevelQueryObject
    on QueryBuilder<IsarMapLevel, IsarMapLevel, QFilterCondition> {}
