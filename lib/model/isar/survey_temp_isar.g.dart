// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_temp_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarSurveyTempCollection on Isar {
  IsarCollection<IsarSurveyTemp> get isarSurveyTemps => this.collection();
}

const IsarSurveyTempSchema = CollectionSchema(
  name: r'IsarSurveyTemp',
  id: 8920620696682367798,
  properties: {
    r'answers': PropertySchema(
      id: 0,
      name: r'answers',
      type: IsarType.objectList,
      target: r'IsarSurveyTempAnswers',
    ),
    r'assignedLevelKey': PropertySchema(
      id: 1,
      name: r'assignedLevelKey',
      type: IsarType.string,
    ),
    r'assignedLevelName': PropertySchema(
      id: 2,
      name: r'assignedLevelName',
      type: IsarType.string,
    ),
    r'geoJsonLevelKey': PropertySchema(
      id: 3,
      name: r'geoJsonLevelKey',
      type: IsarType.string,
    ),
    r'geoJsonLevelName': PropertySchema(
      id: 4,
      name: r'geoJsonLevelName',
      type: IsarType.string,
    ),
    r'surveyLevelKey': PropertySchema(
      id: 5,
      name: r'surveyLevelKey',
      type: IsarType.string,
    ),
    r'surveyLevelName': PropertySchema(
      id: 6,
      name: r'surveyLevelName',
      type: IsarType.string,
    )
  },
  estimateSize: _isarSurveyTempEstimateSize,
  serialize: _isarSurveyTempSerialize,
  deserialize: _isarSurveyTempDeserialize,
  deserializeProp: _isarSurveyTempDeserializeProp,
  idName: r'id',
  indexes: {
    r'surveyLevelName': IndexSchema(
      id: 3926990290908719257,
      name: r'surveyLevelName',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'surveyLevelName',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {
    r'IsarSurveyTempAnswers': IsarSurveyTempAnswersSchema,
    r'IsarDItemTemp': IsarDItemTempSchema
  },
  getId: _isarSurveyTempGetId,
  getLinks: _isarSurveyTempGetLinks,
  attach: _isarSurveyTempAttach,
  version: '3.1.0+1',
);

int _isarSurveyTempEstimateSize(
  IsarSurveyTemp object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.answers;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[IsarSurveyTempAnswers]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += IsarSurveyTempAnswersSchema.estimateSize(
              value, offsets, allOffsets);
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

void _isarSurveyTempSerialize(
  IsarSurveyTemp object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<IsarSurveyTempAnswers>(
    offsets[0],
    allOffsets,
    IsarSurveyTempAnswersSchema.serialize,
    object.answers,
  );
  writer.writeString(offsets[1], object.assignedLevelKey);
  writer.writeString(offsets[2], object.assignedLevelName);
  writer.writeString(offsets[3], object.geoJsonLevelKey);
  writer.writeString(offsets[4], object.geoJsonLevelName);
  writer.writeString(offsets[5], object.surveyLevelKey);
  writer.writeString(offsets[6], object.surveyLevelName);
}

IsarSurveyTemp _isarSurveyTempDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarSurveyTemp();
  object.answers = reader.readObjectList<IsarSurveyTempAnswers>(
    offsets[0],
    IsarSurveyTempAnswersSchema.deserialize,
    allOffsets,
    IsarSurveyTempAnswers(),
  );
  object.assignedLevelKey = reader.readStringOrNull(offsets[1]);
  object.assignedLevelName = reader.readStringOrNull(offsets[2]);
  object.geoJsonLevelKey = reader.readStringOrNull(offsets[3]);
  object.geoJsonLevelName = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.surveyLevelKey = reader.readStringOrNull(offsets[5]);
  object.surveyLevelName = reader.readStringOrNull(offsets[6]);
  return object;
}

P _isarSurveyTempDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<IsarSurveyTempAnswers>(
        offset,
        IsarSurveyTempAnswersSchema.deserialize,
        allOffsets,
        IsarSurveyTempAnswers(),
      )) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarSurveyTempGetId(IsarSurveyTemp object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarSurveyTempGetLinks(IsarSurveyTemp object) {
  return [];
}

void _isarSurveyTempAttach(
    IsarCollection<dynamic> col, Id id, IsarSurveyTemp object) {
  object.id = id;
}

extension IsarSurveyTempQueryWhereSort
    on QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QWhere> {
  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterWhere>
      anySurveyLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'surveyLevelName'),
      );
    });
  }
}

extension IsarSurveyTempQueryWhere
    on QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QWhereClause> {
  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterWhereClause> idBetween(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterWhereClause>
      surveyLevelNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'surveyLevelName',
        value: [null],
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterWhereClause>
      surveyLevelNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'surveyLevelName',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterWhereClause>
      surveyLevelNameEqualTo(String? surveyLevelName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'surveyLevelName',
        value: [surveyLevelName],
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterWhereClause>
      surveyLevelNameNotEqualTo(String? surveyLevelName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'surveyLevelName',
              lower: [],
              upper: [surveyLevelName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'surveyLevelName',
              lower: [surveyLevelName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'surveyLevelName',
              lower: [surveyLevelName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'surveyLevelName',
              lower: [],
              upper: [surveyLevelName],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterWhereClause>
      surveyLevelNameGreaterThan(
    String? surveyLevelName, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'surveyLevelName',
        lower: [surveyLevelName],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterWhereClause>
      surveyLevelNameLessThan(
    String? surveyLevelName, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'surveyLevelName',
        lower: [],
        upper: [surveyLevelName],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterWhereClause>
      surveyLevelNameBetween(
    String? lowerSurveyLevelName,
    String? upperSurveyLevelName, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'surveyLevelName',
        lower: [lowerSurveyLevelName],
        includeLower: includeLower,
        upper: [upperSurveyLevelName],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterWhereClause>
      surveyLevelNameStartsWith(String SurveyLevelNamePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'surveyLevelName',
        lower: [SurveyLevelNamePrefix],
        upper: ['$SurveyLevelNamePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterWhereClause>
      surveyLevelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'surveyLevelName',
        value: [''],
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterWhereClause>
      surveyLevelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'surveyLevelName',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'surveyLevelName',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'surveyLevelName',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'surveyLevelName',
              upper: [''],
            ));
      }
    });
  }
}

extension IsarSurveyTempQueryFilter
    on QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QFilterCondition> {
  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      answersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'answers',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      answersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'answers',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      answersLengthEqualTo(int length) {
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      answersIsEmpty() {
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      answersIsNotEmpty() {
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      answersLengthLessThan(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      answersLengthGreaterThan(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      answersLengthBetween(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      assignedLevelKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assignedLevelKey',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      assignedLevelKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assignedLevelKey',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      assignedLevelKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assignedLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      assignedLevelKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assignedLevelKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      assignedLevelKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedLevelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      assignedLevelKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assignedLevelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      assignedLevelNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assignedLevelName',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      assignedLevelNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assignedLevelName',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      assignedLevelNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assignedLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      assignedLevelNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assignedLevelName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      assignedLevelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedLevelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      assignedLevelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assignedLevelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'geoJsonLevelKey',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'geoJsonLevelKey',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelKeyEqualTo(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelKeyGreaterThan(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelKeyLessThan(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelKeyBetween(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelKeyStartsWith(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelKeyEndsWith(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'geoJsonLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'geoJsonLevelKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoJsonLevelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'geoJsonLevelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'geoJsonLevelName',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'geoJsonLevelName',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelNameEqualTo(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelNameGreaterThan(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelNameLessThan(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelNameBetween(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelNameStartsWith(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelNameEndsWith(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'geoJsonLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'geoJsonLevelName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geoJsonLevelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      geoJsonLevelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'geoJsonLevelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition> idBetween(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surveyLevelKey',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surveyLevelKey',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelKeyEqualTo(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelKeyGreaterThan(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelKeyLessThan(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelKeyBetween(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelKeyStartsWith(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelKeyEndsWith(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'surveyLevelKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'surveyLevelKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surveyLevelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'surveyLevelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surveyLevelName',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surveyLevelName',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelNameEqualTo(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelNameGreaterThan(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelNameLessThan(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelNameBetween(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelNameStartsWith(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelNameEndsWith(
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

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'surveyLevelName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'surveyLevelName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surveyLevelName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      surveyLevelNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'surveyLevelName',
        value: '',
      ));
    });
  }
}

extension IsarSurveyTempQueryObject
    on QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QFilterCondition> {
  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterFilterCondition>
      answersElement(FilterQuery<IsarSurveyTempAnswers> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'answers');
    });
  }
}

extension IsarSurveyTempQueryLinks
    on QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QFilterCondition> {}

extension IsarSurveyTempQuerySortBy
    on QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QSortBy> {
  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      sortByAssignedLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      sortByAssignedLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      sortByAssignedLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelName', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      sortByAssignedLevelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelName', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      sortByGeoJsonLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      sortByGeoJsonLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      sortByGeoJsonLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelName', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      sortByGeoJsonLevelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelName', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      sortBySurveyLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      sortBySurveyLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      sortBySurveyLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevelName', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      sortBySurveyLevelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevelName', Sort.desc);
    });
  }
}

extension IsarSurveyTempQuerySortThenBy
    on QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QSortThenBy> {
  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      thenByAssignedLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      thenByAssignedLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      thenByAssignedLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelName', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      thenByAssignedLevelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelName', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      thenByGeoJsonLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      thenByGeoJsonLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      thenByGeoJsonLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelName', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      thenByGeoJsonLevelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'geoJsonLevelName', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      thenBySurveyLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      thenBySurveyLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      thenBySurveyLevelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevelName', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QAfterSortBy>
      thenBySurveyLevelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyLevelName', Sort.desc);
    });
  }
}

extension IsarSurveyTempQueryWhereDistinct
    on QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QDistinct> {
  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QDistinct>
      distinctByAssignedLevelKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignedLevelKey',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QDistinct>
      distinctByAssignedLevelName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignedLevelName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QDistinct>
      distinctByGeoJsonLevelKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'geoJsonLevelKey',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QDistinct>
      distinctByGeoJsonLevelName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'geoJsonLevelName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QDistinct>
      distinctBySurveyLevelKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surveyLevelKey',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QDistinct>
      distinctBySurveyLevelName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surveyLevelName',
          caseSensitive: caseSensitive);
    });
  }
}

extension IsarSurveyTempQueryProperty
    on QueryBuilder<IsarSurveyTemp, IsarSurveyTemp, QQueryProperty> {
  QueryBuilder<IsarSurveyTemp, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarSurveyTemp, List<IsarSurveyTempAnswers>?, QQueryOperations>
      answersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'answers');
    });
  }

  QueryBuilder<IsarSurveyTemp, String?, QQueryOperations>
      assignedLevelKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignedLevelKey');
    });
  }

  QueryBuilder<IsarSurveyTemp, String?, QQueryOperations>
      assignedLevelNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignedLevelName');
    });
  }

  QueryBuilder<IsarSurveyTemp, String?, QQueryOperations>
      geoJsonLevelKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'geoJsonLevelKey');
    });
  }

  QueryBuilder<IsarSurveyTemp, String?, QQueryOperations>
      geoJsonLevelNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'geoJsonLevelName');
    });
  }

  QueryBuilder<IsarSurveyTemp, String?, QQueryOperations>
      surveyLevelKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surveyLevelKey');
    });
  }

  QueryBuilder<IsarSurveyTemp, String?, QQueryOperations>
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

const IsarSurveyTempAnswersSchema = Schema(
  name: r'IsarSurveyTempAnswers',
  id: -3307603235522869469,
  properties: {
    r'answer': PropertySchema(
      id: 0,
      name: r'answer',
      type: IsarType.string,
    ),
    r'answerOptions': PropertySchema(
      id: 1,
      name: r'answerOptions',
      type: IsarType.objectList,
      target: r'IsarDItemTemp',
    ),
    r'question': PropertySchema(
      id: 2,
      name: r'question',
      type: IsarType.string,
    ),
    r'questionId': PropertySchema(
      id: 3,
      name: r'questionId',
      type: IsarType.long,
    ),
    r'surveyId': PropertySchema(
      id: 4,
      name: r'surveyId',
      type: IsarType.long,
    ),
    r'typeId': PropertySchema(
      id: 5,
      name: r'typeId',
      type: IsarType.long,
    )
  },
  estimateSize: _isarSurveyTempAnswersEstimateSize,
  serialize: _isarSurveyTempAnswersSerialize,
  deserialize: _isarSurveyTempAnswersDeserialize,
  deserializeProp: _isarSurveyTempAnswersDeserializeProp,
);

int _isarSurveyTempAnswersEstimateSize(
  IsarSurveyTempAnswers object,
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
        final offsets = allOffsets[IsarDItemTemp]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              IsarDItemTempSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.question;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarSurveyTempAnswersSerialize(
  IsarSurveyTempAnswers object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.answer);
  writer.writeObjectList<IsarDItemTemp>(
    offsets[1],
    allOffsets,
    IsarDItemTempSchema.serialize,
    object.answerOptions,
  );
  writer.writeString(offsets[2], object.question);
  writer.writeLong(offsets[3], object.questionId);
  writer.writeLong(offsets[4], object.surveyId);
  writer.writeLong(offsets[5], object.typeId);
}

IsarSurveyTempAnswers _isarSurveyTempAnswersDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarSurveyTempAnswers();
  object.answer = reader.readStringOrNull(offsets[0]);
  object.answerOptions = reader.readObjectList<IsarDItemTemp>(
    offsets[1],
    IsarDItemTempSchema.deserialize,
    allOffsets,
    IsarDItemTemp(),
  );
  object.question = reader.readStringOrNull(offsets[2]);
  object.questionId = reader.readLongOrNull(offsets[3]);
  object.surveyId = reader.readLongOrNull(offsets[4]);
  object.typeId = reader.readLongOrNull(offsets[5]);
  return object;
}

P _isarSurveyTempAnswersDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<IsarDItemTemp>(
        offset,
        IsarDItemTempSchema.deserialize,
        allOffsets,
        IsarDItemTemp(),
      )) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarSurveyTempAnswersQueryFilter on QueryBuilder<
    IsarSurveyTempAnswers, IsarSurveyTempAnswers, QFilterCondition> {
  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> answerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'answer',
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> answerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'answer',
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> answerEqualTo(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> answerGreaterThan(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> answerLessThan(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> answerBetween(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> answerStartsWith(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> answerEndsWith(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
          QAfterFilterCondition>
      answerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'answer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
          QAfterFilterCondition>
      answerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'answer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> answerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answer',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> answerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'answer',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> answerOptionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'answerOptions',
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> answerOptionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'answerOptions',
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> answerOptionsLengthEqualTo(int length) {
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> answerOptionsIsEmpty() {
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> answerOptionsIsNotEmpty() {
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> answerOptionsLengthLessThan(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> answerOptionsLengthGreaterThan(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> answerOptionsLengthBetween(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> questionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'question',
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> questionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'question',
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> questionEqualTo(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> questionGreaterThan(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> questionLessThan(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> questionBetween(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> questionStartsWith(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> questionEndsWith(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
          QAfterFilterCondition>
      questionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
          QAfterFilterCondition>
      questionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'question',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> questionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'question',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> questionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'question',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> questionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> questionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> questionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> questionIdGreaterThan(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> questionIdLessThan(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> questionIdBetween(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> surveyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surveyId',
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> surveyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surveyId',
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> surveyIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surveyId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> surveyIdGreaterThan(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> surveyIdLessThan(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> surveyIdBetween(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> typeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'typeId',
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> typeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'typeId',
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> typeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typeId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> typeIdGreaterThan(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> typeIdLessThan(
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

  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
      QAfterFilterCondition> typeIdBetween(
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

extension IsarSurveyTempAnswersQueryObject on QueryBuilder<
    IsarSurveyTempAnswers, IsarSurveyTempAnswers, QFilterCondition> {
  QueryBuilder<IsarSurveyTempAnswers, IsarSurveyTempAnswers,
          QAfterFilterCondition>
      answerOptionsElement(FilterQuery<IsarDItemTemp> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'answerOptions');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IsarDItemTempSchema = Schema(
  name: r'IsarDItemTemp',
  id: 4583927766712112332,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _isarDItemTempEstimateSize,
  serialize: _isarDItemTempSerialize,
  deserialize: _isarDItemTempDeserialize,
  deserializeProp: _isarDItemTempDeserializeProp,
);

int _isarDItemTempEstimateSize(
  IsarDItemTemp object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarDItemTempSerialize(
  IsarDItemTemp object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.id);
  writer.writeString(offsets[1], object.name);
}

IsarDItemTemp _isarDItemTempDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarDItemTemp();
  object.id = reader.readLongOrNull(offsets[0]);
  object.name = reader.readStringOrNull(offsets[1]);
  return object;
}

P _isarDItemTempDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarDItemTempQueryFilter
    on QueryBuilder<IsarDItemTemp, IsarDItemTemp, QFilterCondition> {
  QueryBuilder<IsarDItemTemp, IsarDItemTemp, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarDItemTemp, IsarDItemTemp, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarDItemTemp, IsarDItemTemp, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarDItemTemp, IsarDItemTemp, QAfterFilterCondition>
      idGreaterThan(
    int? value, {
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

  QueryBuilder<IsarDItemTemp, IsarDItemTemp, QAfterFilterCondition> idLessThan(
    int? value, {
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

  QueryBuilder<IsarDItemTemp, IsarDItemTemp, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<IsarDItemTemp, IsarDItemTemp, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<IsarDItemTemp, IsarDItemTemp, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<IsarDItemTemp, IsarDItemTemp, QAfterFilterCondition> nameEqualTo(
    String? value, {
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

  QueryBuilder<IsarDItemTemp, IsarDItemTemp, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
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

  QueryBuilder<IsarDItemTemp, IsarDItemTemp, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
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

  QueryBuilder<IsarDItemTemp, IsarDItemTemp, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
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

  QueryBuilder<IsarDItemTemp, IsarDItemTemp, QAfterFilterCondition>
      nameStartsWith(
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

  QueryBuilder<IsarDItemTemp, IsarDItemTemp, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<IsarDItemTemp, IsarDItemTemp, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDItemTemp, IsarDItemTemp, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<IsarDItemTemp, IsarDItemTemp, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarDItemTemp, IsarDItemTemp, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension IsarDItemTempQueryObject
    on QueryBuilder<IsarDItemTemp, IsarDItemTemp, QFilterCondition> {}
