// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_level_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarSurveyLevelModelCollection on Isar {
  IsarCollection<IsarSurveyLevelModel> get isarSurveyLevelModels =>
      this.collection();
}

const IsarSurveyLevelModelSchema = CollectionSchema(
  name: r'IsarSurveyLevelModel',
  id: 4532634428297800234,
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
    r'geoJsonLevelKey': PropertySchema(
      id: 2,
      name: r'geoJsonLevelKey',
      type: IsarType.string,
    ),
    r'geoJsonLevelName': PropertySchema(
      id: 3,
      name: r'geoJsonLevelName',
      type: IsarType.string,
    ),
    r'levels': PropertySchema(
      id: 4,
      name: r'levels',
      type: IsarType.objectList,
      target: r'IsarSureveyLevel',
    )
  },
  estimateSize: _isarSurveyLevelModelEstimateSize,
  serialize: _isarSurveyLevelModelSerialize,
  deserialize: _isarSurveyLevelModelDeserialize,
  deserializeProp: _isarSurveyLevelModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'geoJsonLevelKey': IndexSchema(
      id: -4213153389696512757,
      name: r'geoJsonLevelKey',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'geoJsonLevelKey',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'IsarSureveyLevel': IsarSureveyLevelSchema},
  getId: _isarSurveyLevelModelGetId,
  getLinks: _isarSurveyLevelModelGetLinks,
  attach: _isarSurveyLevelModelAttach,
  version: '3.1.0+1',
);

int _isarSurveyLevelModelEstimateSize(
  IsarSurveyLevelModel object,
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
    final value = object.geoJsonLevelKey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.geoJsonLevelName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.levels;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[IsarSureveyLevel]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              IsarSureveyLevelSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _isarSurveyLevelModelSerialize(
  IsarSurveyLevelModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.assignedLevelKey);
  writer.writeString(offsets[1], object.assignedLevelName);
  writer.writeString(offsets[2], object.geoJsonLevelKey);
  writer.writeString(offsets[3], object.geoJsonLevelName);
  writer.writeObjectList<IsarSureveyLevel>(
    offsets[4],
    allOffsets,
    IsarSureveyLevelSchema.serialize,
    object.levels,
  );
}

IsarSurveyLevelModel _isarSurveyLevelModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarSurveyLevelModel();
  object.assignedLevelKey = reader.readStringOrNull(offsets[0]);
  object.assignedLevelName = reader.readStringOrNull(offsets[1]);
  object.geoJsonLevelKey = reader.readStringOrNull(offsets[2]);
  object.geoJsonLevelName = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.levels = reader.readObjectList<IsarSureveyLevel>(
    offsets[4],
    IsarSureveyLevelSchema.deserialize,
    allOffsets,
    IsarSureveyLevel(),
  );
  return object;
}

P _isarSurveyLevelModelDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readObjectList<IsarSureveyLevel>(
        offset,
        IsarSureveyLevelSchema.deserialize,
        allOffsets,
        IsarSureveyLevel(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarSurveyLevelModelGetId(IsarSurveyLevelModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarSurveyLevelModelGetLinks(
    IsarSurveyLevelModel object) {
  return [];
}

void _isarSurveyLevelModelAttach(
    IsarCollection<dynamic> col, Id id, IsarSurveyLevelModel object) {
  object.id = id;
}

extension IsarSurveyLevelModelQueryWhereSort
    on QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QWhere> {
  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterWhere>
      anyGeoJsonLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'geoJsonLevelKey'),
      );
    });
  }
}

extension IsarSurveyLevelModelQueryWhere
    on QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QWhereClause> {
  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterWhereClause>
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterWhereClause>
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterWhereClause>
      geoJsonLevelKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'geoJsonLevelKey',
        value: [null],
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterWhereClause>
      geoJsonLevelKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'geoJsonLevelKey',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterWhereClause>
      geoJsonLevelKeyEqualTo(String? geoJsonLevelKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'geoJsonLevelKey',
        value: [geoJsonLevelKey],
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterWhereClause>
      geoJsonLevelKeyNotEqualTo(String? geoJsonLevelKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'geoJsonLevelKey',
              lower: [],
              upper: [geoJsonLevelKey],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'geoJsonLevelKey',
              lower: [geoJsonLevelKey],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'geoJsonLevelKey',
              lower: [geoJsonLevelKey],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'geoJsonLevelKey',
              lower: [],
              upper: [geoJsonLevelKey],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterWhereClause>
      geoJsonLevelKeyGreaterThan(
    String? geoJsonLevelKey, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'geoJsonLevelKey',
        lower: [geoJsonLevelKey],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterWhereClause>
      geoJsonLevelKeyLessThan(
    String? geoJsonLevelKey, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'geoJsonLevelKey',
        lower: [],
        upper: [geoJsonLevelKey],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterWhereClause>
      geoJsonLevelKeyBetween(
    String? lowerGeoJsonLevelKey,
    String? upperGeoJsonLevelKey, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'geoJsonLevelKey',
        lower: [lowerGeoJsonLevelKey],
        includeLower: includeLower,
        upper: [upperGeoJsonLevelKey],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterWhereClause>
      geoJsonLevelKeyStartsWith(String GeoJsonLevelKeyPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'geoJsonLevelKey',
        lower: [GeoJsonLevelKeyPrefix],
        upper: ['$GeoJsonLevelKeyPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterWhereClause>
      geoJsonLevelKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'geoJsonLevelKey',
        value: [''],
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterWhereClause>
      geoJsonLevelKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'geoJsonLevelKey',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'geoJsonLevelKey',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'geoJsonLevelKey',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'geoJsonLevelKey',
              upper: [''],
            ));
      }
    });
  }
}

extension IsarSurveyLevelModelQueryFilter on QueryBuilder<IsarSurveyLevelModel,
    IsarSurveyLevelModel, QFilterCondition> {
  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> assignedLevelKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assignedLevelKey',
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> assignedLevelKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assignedLevelKey',
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> assignedLevelKeyEqualTo(
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> assignedLevelKeyGreaterThan(
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> assignedLevelKeyLessThan(
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> assignedLevelKeyBetween(
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> assignedLevelKeyStartsWith(
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> assignedLevelKeyEndsWith(
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
          QAfterFilterCondition>
      assignedLevelKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assignedLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
          QAfterFilterCondition>
      assignedLevelKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assignedLevelKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> assignedLevelKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedLevelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> assignedLevelKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assignedLevelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> assignedLevelNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assignedLevelName',
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> assignedLevelNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assignedLevelName',
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> assignedLevelNameEqualTo(
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> assignedLevelNameGreaterThan(
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> assignedLevelNameLessThan(
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> assignedLevelNameBetween(
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> assignedLevelNameStartsWith(
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> assignedLevelNameEndsWith(
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
          QAfterFilterCondition>
      assignedLevelNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assignedLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
          QAfterFilterCondition>
      assignedLevelNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assignedLevelName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> assignedLevelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedLevelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> assignedLevelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assignedLevelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> geoJsonLevelKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'geoJsonLevelKey',
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> geoJsonLevelKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'geoJsonLevelKey',
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> geoJsonLevelKeyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoJsonLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> geoJsonLevelKeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'geoJsonLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> geoJsonLevelKeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'geoJsonLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> geoJsonLevelKeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'geoJsonLevelKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> geoJsonLevelKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'geoJsonLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> geoJsonLevelKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'geoJsonLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
          QAfterFilterCondition>
      geoJsonLevelKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'geoJsonLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
          QAfterFilterCondition>
      geoJsonLevelKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'geoJsonLevelKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> geoJsonLevelKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoJsonLevelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> geoJsonLevelKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'geoJsonLevelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> geoJsonLevelNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'geoJsonLevelName',
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> geoJsonLevelNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'geoJsonLevelName',
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> geoJsonLevelNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoJsonLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> geoJsonLevelNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'geoJsonLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> geoJsonLevelNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'geoJsonLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> geoJsonLevelNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'geoJsonLevelName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> geoJsonLevelNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'geoJsonLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> geoJsonLevelNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'geoJsonLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
          QAfterFilterCondition>
      geoJsonLevelNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'geoJsonLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
          QAfterFilterCondition>
      geoJsonLevelNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'geoJsonLevelName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> geoJsonLevelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoJsonLevelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> geoJsonLevelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'geoJsonLevelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> levelsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'levels',
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> levelsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'levels',
      ));
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> levelsLengthEqualTo(int length) {
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> levelsIsEmpty() {
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> levelsIsNotEmpty() {
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> levelsLengthLessThan(
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> levelsLengthGreaterThan(
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

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> levelsLengthBetween(
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

extension IsarSurveyLevelModelQueryObject on QueryBuilder<IsarSurveyLevelModel,
    IsarSurveyLevelModel, QFilterCondition> {
  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel,
      QAfterFilterCondition> levelsElement(FilterQuery<IsarSureveyLevel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'levels');
    });
  }
}

extension IsarSurveyLevelModelQueryLinks on QueryBuilder<IsarSurveyLevelModel,
    IsarSurveyLevelModel, QFilterCondition> {}

extension IsarSurveyLevelModelQuerySortBy
    on QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QSortBy> {
  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterSortBy>
      sortByAssignedLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterSortBy>
      sortByAssignedLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterSortBy>
      sortByAssignedLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelName', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterSortBy>
      sortByAssignedLevelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelName', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterSortBy>
      sortByGeoJsonLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterSortBy>
      sortByGeoJsonLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterSortBy>
      sortByGeoJsonLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelName', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterSortBy>
      sortByGeoJsonLevelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelName', Sort.desc);
    });
  }
}

extension IsarSurveyLevelModelQuerySortThenBy
    on QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QSortThenBy> {
  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterSortBy>
      thenByAssignedLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterSortBy>
      thenByAssignedLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterSortBy>
      thenByAssignedLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelName', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterSortBy>
      thenByAssignedLevelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelName', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterSortBy>
      thenByGeoJsonLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterSortBy>
      thenByGeoJsonLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterSortBy>
      thenByGeoJsonLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelName', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterSortBy>
      thenByGeoJsonLevelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelName', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension IsarSurveyLevelModelQueryWhereDistinct
    on QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QDistinct> {
  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QDistinct>
      distinctByAssignedLevelKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignedLevelKey',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QDistinct>
      distinctByAssignedLevelName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignedLevelName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QDistinct>
      distinctByGeoJsonLevelKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'geoJsonLevelKey',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSurveyLevelModel, IsarSurveyLevelModel, QDistinct>
      distinctByGeoJsonLevelName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'geoJsonLevelName',
          caseSensitive: caseSensitive);
    });
  }
}

extension IsarSurveyLevelModelQueryProperty on QueryBuilder<
    IsarSurveyLevelModel, IsarSurveyLevelModel, QQueryProperty> {
  QueryBuilder<IsarSurveyLevelModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarSurveyLevelModel, String?, QQueryOperations>
      assignedLevelKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignedLevelKey');
    });
  }

  QueryBuilder<IsarSurveyLevelModel, String?, QQueryOperations>
      assignedLevelNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignedLevelName');
    });
  }

  QueryBuilder<IsarSurveyLevelModel, String?, QQueryOperations>
      geoJsonLevelKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'geoJsonLevelKey');
    });
  }

  QueryBuilder<IsarSurveyLevelModel, String?, QQueryOperations>
      geoJsonLevelNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'geoJsonLevelName');
    });
  }

  QueryBuilder<IsarSurveyLevelModel, List<IsarSureveyLevel>?, QQueryOperations>
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

const IsarSureveyLevelSchema = Schema(
  name: r'IsarSureveyLevel',
  id: 8065740295268609017,
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
    )
  },
  estimateSize: _isarSureveyLevelEstimateSize,
  serialize: _isarSureveyLevelSerialize,
  deserialize: _isarSureveyLevelDeserialize,
  deserializeProp: _isarSureveyLevelDeserializeProp,
);

int _isarSureveyLevelEstimateSize(
  IsarSureveyLevel object,
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

void _isarSureveyLevelSerialize(
  IsarSureveyLevel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.geoJson);
  writer.writeString(offsets[1], object.levelKey);
  writer.writeString(offsets[2], object.levelName);
}

IsarSureveyLevel _isarSureveyLevelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarSureveyLevel();
  object.geoJson = reader.readStringOrNull(offsets[0]);
  object.levelKey = reader.readStringOrNull(offsets[1]);
  object.levelName = reader.readStringOrNull(offsets[2]);
  return object;
}

P _isarSureveyLevelDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarSureveyLevelQueryFilter
    on QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QFilterCondition> {
  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
      geoJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'geoJson',
      ));
    });
  }

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
      geoJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'geoJson',
      ));
    });
  }

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
      geoJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'geoJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
      geoJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'geoJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
      geoJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoJson',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
      geoJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'geoJson',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
      levelKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'levelKey',
      ));
    });
  }

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
      levelKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'levelKey',
      ));
    });
  }

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
      levelKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'levelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
      levelKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'levelKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
      levelKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'levelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
      levelKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'levelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
      levelNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'levelName',
      ));
    });
  }

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
      levelNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'levelName',
      ));
    });
  }

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
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

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
      levelNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'levelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
      levelNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'levelName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
      levelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'levelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QAfterFilterCondition>
      levelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'levelName',
        value: '',
      ));
    });
  }
}

extension IsarSureveyLevelQueryObject
    on QueryBuilder<IsarSureveyLevel, IsarSureveyLevel, QFilterCondition> {}
