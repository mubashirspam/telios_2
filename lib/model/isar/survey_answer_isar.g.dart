// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_answer_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarSurveyAnswerModelCollection on Isar {
  IsarCollection<IsarSurveyAnswerModel> get isarSurveyAnswerModels =>
      this.collection();
}

const IsarSurveyAnswerModelSchema = CollectionSchema(
  name: r'IsarSurveyAnswerModel',
  id: 8482676791063483843,
  properties: {
    r'aCategory': PropertySchema(
      id: 0,
      name: r'aCategory',
      type: IsarType.string,
    ),
    r'answers': PropertySchema(
      id: 1,
      name: r'answers',
      type: IsarType.objectList,
      target: r'IsarAnswer',
    ),
    r'assignedLevelKey': PropertySchema(
      id: 2,
      name: r'assignedLevelKey',
      type: IsarType.string,
    ),
    r'assignedLevelName': PropertySchema(
      id: 3,
      name: r'assignedLevelName',
      type: IsarType.string,
    ),
    r'gCategory': PropertySchema(
      id: 4,
      name: r'gCategory',
      type: IsarType.string,
    ),
    r'geoJsonLevelKey': PropertySchema(
      id: 5,
      name: r'geoJsonLevelKey',
      type: IsarType.string,
    ),
    r'geoJsonLevelName': PropertySchema(
      id: 6,
      name: r'geoJsonLevelName',
      type: IsarType.string,
    ),
    r'sCategory': PropertySchema(
      id: 7,
      name: r'sCategory',
      type: IsarType.string,
    ),
    r'surveyLevelKey': PropertySchema(
      id: 8,
      name: r'surveyLevelKey',
      type: IsarType.string,
    ),
    r'surveyLevelName': PropertySchema(
      id: 9,
      name: r'surveyLevelName',
      type: IsarType.string,
    )
  },
  estimateSize: _isarSurveyAnswerModelEstimateSize,
  serialize: _isarSurveyAnswerModelSerialize,
  deserialize: _isarSurveyAnswerModelDeserialize,
  deserializeProp: _isarSurveyAnswerModelDeserializeProp,
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
  embeddedSchemas: {r'IsarAnswer': IsarAnswerSchema},
  getId: _isarSurveyAnswerModelGetId,
  getLinks: _isarSurveyAnswerModelGetLinks,
  attach: _isarSurveyAnswerModelAttach,
  version: '3.1.0+1',
);

int _isarSurveyAnswerModelEstimateSize(
  IsarSurveyAnswerModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.aCategory;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.answers;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[IsarAnswer]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              IsarAnswerSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
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
    final value = object.gCategory;
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
    final value = object.sCategory;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.surveyLevelKey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.surveyLevelName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarSurveyAnswerModelSerialize(
  IsarSurveyAnswerModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.aCategory);
  writer.writeObjectList<IsarAnswer>(
    offsets[1],
    allOffsets,
    IsarAnswerSchema.serialize,
    object.answers,
  );
  writer.writeString(offsets[2], object.assignedLevelKey);
  writer.writeString(offsets[3], object.assignedLevelName);
  writer.writeString(offsets[4], object.gCategory);
  writer.writeString(offsets[5], object.geoJsonLevelKey);
  writer.writeString(offsets[6], object.geoJsonLevelName);
  writer.writeString(offsets[7], object.sCategory);
  writer.writeString(offsets[8], object.surveyLevelKey);
  writer.writeString(offsets[9], object.surveyLevelName);
}

IsarSurveyAnswerModel _isarSurveyAnswerModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarSurveyAnswerModel();
  object.aCategory = reader.readStringOrNull(offsets[0]);
  object.answers = reader.readObjectList<IsarAnswer>(
    offsets[1],
    IsarAnswerSchema.deserialize,
    allOffsets,
    IsarAnswer(),
  );
  object.assignedLevelKey = reader.readStringOrNull(offsets[2]);
  object.assignedLevelName = reader.readStringOrNull(offsets[3]);
  object.gCategory = reader.readStringOrNull(offsets[4]);
  object.geoJsonLevelKey = reader.readStringOrNull(offsets[5]);
  object.geoJsonLevelName = reader.readStringOrNull(offsets[6]);
  object.id = id;
  object.sCategory = reader.readStringOrNull(offsets[7]);
  object.surveyLevelKey = reader.readStringOrNull(offsets[8]);
  object.surveyLevelName = reader.readStringOrNull(offsets[9]);
  return object;
}

P _isarSurveyAnswerModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<IsarAnswer>(
        offset,
        IsarAnswerSchema.deserialize,
        allOffsets,
        IsarAnswer(),
      )) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarSurveyAnswerModelGetId(IsarSurveyAnswerModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarSurveyAnswerModelGetLinks(
    IsarSurveyAnswerModel object) {
  return [];
}

void _isarSurveyAnswerModelAttach(
    IsarCollection<dynamic> col, Id id, IsarSurveyAnswerModel object) {
  object.id = id;
}

extension IsarSurveyAnswerModelQueryWhereSort
    on QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QWhere> {
  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterWhere>
      anyGeoJsonLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'geoJsonLevelKey'),
      );
    });
  }
}

extension IsarSurveyAnswerModelQueryWhere on QueryBuilder<IsarSurveyAnswerModel,
    IsarSurveyAnswerModel, QWhereClause> {
  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterWhereClause>
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterWhereClause>
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterWhereClause>
      geoJsonLevelKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'geoJsonLevelKey',
        value: [null],
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterWhereClause>
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterWhereClause>
      geoJsonLevelKeyEqualTo(String? geoJsonLevelKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'geoJsonLevelKey',
        value: [geoJsonLevelKey],
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterWhereClause>
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterWhereClause>
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterWhereClause>
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterWhereClause>
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterWhereClause>
      geoJsonLevelKeyStartsWith(String GeoJsonLevelKeyPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'geoJsonLevelKey',
        lower: [GeoJsonLevelKeyPrefix],
        upper: ['$GeoJsonLevelKeyPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterWhereClause>
      geoJsonLevelKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'geoJsonLevelKey',
        value: [''],
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterWhereClause>
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

extension IsarSurveyAnswerModelQueryFilter on QueryBuilder<
    IsarSurveyAnswerModel, IsarSurveyAnswerModel, QFilterCondition> {
  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> aCategoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'aCategory',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> aCategoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'aCategory',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> aCategoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> aCategoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> aCategoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> aCategoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> aCategoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> aCategoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
          QAfterFilterCondition>
      aCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
          QAfterFilterCondition>
      aCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> aCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> aCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'aCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> answersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'answers',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> answersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'answers',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> answersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> answersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> answersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> answersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> answersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> answersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> assignedLevelKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assignedLevelKey',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> assignedLevelKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assignedLevelKey',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> assignedLevelKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedLevelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> assignedLevelKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assignedLevelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> assignedLevelNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assignedLevelName',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> assignedLevelNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assignedLevelName',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> assignedLevelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedLevelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> assignedLevelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assignedLevelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> gCategoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gCategory',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> gCategoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gCategory',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> gCategoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> gCategoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> gCategoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> gCategoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> gCategoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> gCategoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
          QAfterFilterCondition>
      gCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
          QAfterFilterCondition>
      gCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> gCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> gCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> geoJsonLevelKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'geoJsonLevelKey',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> geoJsonLevelKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'geoJsonLevelKey',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> geoJsonLevelKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoJsonLevelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> geoJsonLevelKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'geoJsonLevelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> geoJsonLevelNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'geoJsonLevelName',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> geoJsonLevelNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'geoJsonLevelName',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> geoJsonLevelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoJsonLevelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> geoJsonLevelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'geoJsonLevelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
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

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> sCategoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sCategory',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> sCategoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sCategory',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> sCategoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> sCategoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> sCategoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> sCategoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> sCategoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> sCategoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
          QAfterFilterCondition>
      sCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
          QAfterFilterCondition>
      sCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> sCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> sCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> surveyLevelKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surveyLevelKey',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> surveyLevelKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surveyLevelKey',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> surveyLevelKeyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surveyLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> surveyLevelKeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surveyLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> surveyLevelKeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surveyLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> surveyLevelKeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surveyLevelKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> surveyLevelKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'surveyLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> surveyLevelKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'surveyLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
          QAfterFilterCondition>
      surveyLevelKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'surveyLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
          QAfterFilterCondition>
      surveyLevelKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'surveyLevelKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> surveyLevelKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surveyLevelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> surveyLevelKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'surveyLevelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> surveyLevelNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surveyLevelName',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> surveyLevelNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surveyLevelName',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> surveyLevelNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surveyLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> surveyLevelNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surveyLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> surveyLevelNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surveyLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> surveyLevelNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surveyLevelName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> surveyLevelNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'surveyLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> surveyLevelNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'surveyLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
          QAfterFilterCondition>
      surveyLevelNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'surveyLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
          QAfterFilterCondition>
      surveyLevelNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'surveyLevelName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> surveyLevelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surveyLevelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> surveyLevelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'surveyLevelName',
        value: '',
      ));
    });
  }
}

extension IsarSurveyAnswerModelQueryObject on QueryBuilder<
    IsarSurveyAnswerModel, IsarSurveyAnswerModel, QFilterCondition> {
  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel,
      QAfterFilterCondition> answersElement(FilterQuery<IsarAnswer> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'answers');
    });
  }
}

extension IsarSurveyAnswerModelQueryLinks on QueryBuilder<IsarSurveyAnswerModel,
    IsarSurveyAnswerModel, QFilterCondition> {}

extension IsarSurveyAnswerModelQuerySortBy
    on QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QSortBy> {
  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      sortByACategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aCategory', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      sortByACategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aCategory', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      sortByAssignedLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      sortByAssignedLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      sortByAssignedLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelName', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      sortByAssignedLevelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelName', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      sortByGCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gCategory', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      sortByGCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gCategory', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      sortByGeoJsonLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      sortByGeoJsonLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      sortByGeoJsonLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelName', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      sortByGeoJsonLevelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelName', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      sortBySCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sCategory', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      sortBySCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sCategory', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      sortBySurveyLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      sortBySurveyLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      sortBySurveyLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevelName', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      sortBySurveyLevelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevelName', Sort.desc);
    });
  }
}

extension IsarSurveyAnswerModelQuerySortThenBy
    on QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QSortThenBy> {
  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      thenByACategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aCategory', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      thenByACategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aCategory', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      thenByAssignedLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      thenByAssignedLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      thenByAssignedLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelName', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      thenByAssignedLevelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelName', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      thenByGCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gCategory', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      thenByGCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gCategory', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      thenByGeoJsonLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      thenByGeoJsonLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      thenByGeoJsonLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelName', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      thenByGeoJsonLevelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelName', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      thenBySCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sCategory', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      thenBySCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sCategory', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      thenBySurveyLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      thenBySurveyLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      thenBySurveyLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevelName', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QAfterSortBy>
      thenBySurveyLevelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevelName', Sort.desc);
    });
  }
}

extension IsarSurveyAnswerModelQueryWhereDistinct
    on QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QDistinct> {
  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QDistinct>
      distinctByACategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aCategory', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QDistinct>
      distinctByAssignedLevelKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignedLevelKey',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QDistinct>
      distinctByAssignedLevelName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignedLevelName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QDistinct>
      distinctByGCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gCategory', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QDistinct>
      distinctByGeoJsonLevelKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'geoJsonLevelKey',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QDistinct>
      distinctByGeoJsonLevelName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'geoJsonLevelName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QDistinct>
      distinctBySCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sCategory', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QDistinct>
      distinctBySurveyLevelKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surveyLevelKey',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, IsarSurveyAnswerModel, QDistinct>
      distinctBySurveyLevelName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surveyLevelName',
          caseSensitive: caseSensitive);
    });
  }
}

extension IsarSurveyAnswerModelQueryProperty on QueryBuilder<
    IsarSurveyAnswerModel, IsarSurveyAnswerModel, QQueryProperty> {
  QueryBuilder<IsarSurveyAnswerModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, String?, QQueryOperations>
      aCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aCategory');
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, List<IsarAnswer>?, QQueryOperations>
      answersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answers');
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, String?, QQueryOperations>
      assignedLevelKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignedLevelKey');
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, String?, QQueryOperations>
      assignedLevelNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignedLevelName');
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, String?, QQueryOperations>
      gCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gCategory');
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, String?, QQueryOperations>
      geoJsonLevelKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'geoJsonLevelKey');
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, String?, QQueryOperations>
      geoJsonLevelNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'geoJsonLevelName');
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, String?, QQueryOperations>
      sCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sCategory');
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, String?, QQueryOperations>
      surveyLevelKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surveyLevelKey');
    });
  }

  QueryBuilder<IsarSurveyAnswerModel, String?, QQueryOperations>
      surveyLevelNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surveyLevelName');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IsarAnswerSchema = Schema(
  name: r'IsarAnswer',
  id: 4665427033348377331,
  properties: {
    r'answer': PropertySchema(
      id: 0,
      name: r'answer',
      type: IsarType.string,
    ),
    r'answerOptions': PropertySchema(
      id: 1,
      name: r'answerOptions',
      type: IsarType.stringList,
    ),
    r'category': PropertySchema(
      id: 2,
      name: r'category',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 3,
      name: r'id',
      type: IsarType.string,
    ),
    r'question': PropertySchema(
      id: 4,
      name: r'question',
      type: IsarType.string,
    ),
    r'questionId': PropertySchema(
      id: 5,
      name: r'questionId',
      type: IsarType.long,
    ),
    r'surveyId': PropertySchema(
      id: 6,
      name: r'surveyId',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 7,
      name: r'type',
      type: IsarType.string,
    ),
    r'typeId': PropertySchema(
      id: 8,
      name: r'typeId',
      type: IsarType.long,
    )
  },
  estimateSize: _isarAnswerEstimateSize,
  serialize: _isarAnswerSerialize,
  deserialize: _isarAnswerDeserialize,
  deserializeProp: _isarAnswerDeserializeProp,
);

int _isarAnswerEstimateSize(
  IsarAnswer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.answer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.answerOptions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.category;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.id;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.question;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.type;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarAnswerSerialize(
  IsarAnswer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.answer);
  writer.writeStringList(offsets[1], object.answerOptions);
  writer.writeString(offsets[2], object.category);
  writer.writeString(offsets[3], object.id);
  writer.writeString(offsets[4], object.question);
  writer.writeLong(offsets[5], object.questionId);
  writer.writeLong(offsets[6], object.surveyId);
  writer.writeString(offsets[7], object.type);
  writer.writeLong(offsets[8], object.typeId);
}

IsarAnswer _isarAnswerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarAnswer();
  object.answer = reader.readStringOrNull(offsets[0]);
  object.answerOptions = reader.readStringList(offsets[1]);
  object.category = reader.readStringOrNull(offsets[2]);
  object.id = reader.readStringOrNull(offsets[3]);
  object.question = reader.readStringOrNull(offsets[4]);
  object.questionId = reader.readLongOrNull(offsets[5]);
  object.surveyId = reader.readLongOrNull(offsets[6]);
  object.type = reader.readStringOrNull(offsets[7]);
  object.typeId = reader.readLongOrNull(offsets[8]);
  return object;
}

P _isarAnswerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringList(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarAnswerQueryFilter
    on QueryBuilder<IsarAnswer, IsarAnswer, QFilterCondition> {
  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> answerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'answer',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      answerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'answer',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> answerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> answerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> answerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> answerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'answer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> answerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> answerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> answerContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> answerMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'answer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> answerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answer',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      answerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'answer',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      answerOptionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'answerOptions',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      answerOptionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'answerOptions',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      answerOptionsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answerOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      answerOptionsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'answerOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      answerOptionsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'answerOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      answerOptionsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'answerOptions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      answerOptionsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'answerOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      answerOptionsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'answerOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      answerOptionsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'answerOptions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      answerOptionsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'answerOptions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      answerOptionsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answerOptions',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      answerOptionsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'answerOptions',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      answerOptionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answerOptions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      answerOptionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answerOptions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      answerOptionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answerOptions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      answerOptionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answerOptions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      answerOptionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answerOptions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      answerOptionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'answerOptions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      categoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> categoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      categoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> categoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> categoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> categoryContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> categoryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> idEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> idGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> idLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> idBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> questionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'question',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      questionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'question',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> questionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      questionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> questionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> questionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'question',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      questionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> questionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> questionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> questionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'question',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      questionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'question',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      questionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'question',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      questionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      questionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> questionIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      questionIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      questionIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> questionIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> surveyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surveyId',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      surveyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surveyId',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> surveyIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surveyId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      surveyIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surveyId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> surveyIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surveyId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> surveyIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surveyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> typeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> typeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> typeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> typeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> typeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> typeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'typeId',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition>
      typeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'typeId',
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> typeIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typeId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> typeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'typeId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> typeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'typeId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarAnswer, IsarAnswer, QAfterFilterCondition> typeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'typeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarAnswerQueryObject
    on QueryBuilder<IsarAnswer, IsarAnswer, QFilterCondition> {}
