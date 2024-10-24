// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_question_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarSurveyQusetionModelCollection on Isar {
  IsarCollection<IsarSurveyQusetionModel> get isarSurveyQusetionModels =>
      this.collection();
}

const IsarSurveyQusetionModelSchema = CollectionSchema(
  name: r'IsarSurveyQusetionModel',
  id: 4202039731293240529,
  properties: {
    r'assignedLevelKey': PropertySchema(
      id: 0,
      name: r'assignedLevelKey',
      type: IsarType.string,
    ),
    r'category': PropertySchema(
      id: 1,
      name: r'category',
      type: IsarType.objectList,
      target: r'IsarSurveyCategory',
    ),
    r'questions': PropertySchema(
      id: 2,
      name: r'questions',
      type: IsarType.objectList,
      target: r'IsarSurveyQusetion',
    ),
    r'sureveyId': PropertySchema(
      id: 3,
      name: r'sureveyId',
      type: IsarType.long,
    ),
    r'surveyName': PropertySchema(
      id: 4,
      name: r'surveyName',
      type: IsarType.string,
    )
  },
  estimateSize: _isarSurveyQusetionModelEstimateSize,
  serialize: _isarSurveyQusetionModelSerialize,
  deserialize: _isarSurveyQusetionModelDeserialize,
  deserializeProp: _isarSurveyQusetionModelDeserializeProp,
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
  embeddedSchemas: {
    r'IsarSurveyQusetion': IsarSurveyQusetionSchema,
    r'IsarSurveyCategory': IsarSurveyCategorySchema
  },
  getId: _isarSurveyQusetionModelGetId,
  getLinks: _isarSurveyQusetionModelGetLinks,
  attach: _isarSurveyQusetionModelAttach,
  version: '3.1.0+1',
);

int _isarSurveyQusetionModelEstimateSize(
  IsarSurveyQusetionModel object,
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
    final list = object.category;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[IsarSurveyCategory]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              IsarSurveyCategorySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.questions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[IsarSurveyQusetion]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              IsarSurveyQusetionSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.surveyName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarSurveyQusetionModelSerialize(
  IsarSurveyQusetionModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.assignedLevelKey);
  writer.writeObjectList<IsarSurveyCategory>(
    offsets[1],
    allOffsets,
    IsarSurveyCategorySchema.serialize,
    object.category,
  );
  writer.writeObjectList<IsarSurveyQusetion>(
    offsets[2],
    allOffsets,
    IsarSurveyQusetionSchema.serialize,
    object.questions,
  );
  writer.writeLong(offsets[3], object.sureveyId);
  writer.writeString(offsets[4], object.surveyName);
}

IsarSurveyQusetionModel _isarSurveyQusetionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarSurveyQusetionModel();
  object.assignedLevelKey = reader.readStringOrNull(offsets[0]);
  object.category = reader.readObjectList<IsarSurveyCategory>(
    offsets[1],
    IsarSurveyCategorySchema.deserialize,
    allOffsets,
    IsarSurveyCategory(),
  );
  object.id = id;
  object.questions = reader.readObjectList<IsarSurveyQusetion>(
    offsets[2],
    IsarSurveyQusetionSchema.deserialize,
    allOffsets,
    IsarSurveyQusetion(),
  );
  object.sureveyId = reader.readLongOrNull(offsets[3]);
  object.surveyName = reader.readStringOrNull(offsets[4]);
  return object;
}

P _isarSurveyQusetionModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<IsarSurveyCategory>(
        offset,
        IsarSurveyCategorySchema.deserialize,
        allOffsets,
        IsarSurveyCategory(),
      )) as P;
    case 2:
      return (reader.readObjectList<IsarSurveyQusetion>(
        offset,
        IsarSurveyQusetionSchema.deserialize,
        allOffsets,
        IsarSurveyQusetion(),
      )) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarSurveyQusetionModelGetId(IsarSurveyQusetionModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarSurveyQusetionModelGetLinks(
    IsarSurveyQusetionModel object) {
  return [];
}

void _isarSurveyQusetionModelAttach(
    IsarCollection<dynamic> col, Id id, IsarSurveyQusetionModel object) {
  object.id = id;
}

extension IsarSurveyQusetionModelQueryWhereSort
    on QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QWhere> {
  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QAfterWhere>
      anyAssignedLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'assignedLevelKey'),
      );
    });
  }
}

extension IsarSurveyQusetionModelQueryWhere on QueryBuilder<
    IsarSurveyQusetionModel, IsarSurveyQusetionModel, QWhereClause> {
  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterWhereClause> idBetween(
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

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterWhereClause> assignedLevelKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'assignedLevelKey',
        value: [null],
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterWhereClause> assignedLevelKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'assignedLevelKey',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterWhereClause> assignedLevelKeyEqualTo(String? assignedLevelKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'assignedLevelKey',
        value: [assignedLevelKey],
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterWhereClause> assignedLevelKeyNotEqualTo(String? assignedLevelKey) {
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

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterWhereClause> assignedLevelKeyGreaterThan(
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

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterWhereClause> assignedLevelKeyLessThan(
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

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterWhereClause> assignedLevelKeyBetween(
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

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
          QAfterWhereClause>
      assignedLevelKeyStartsWith(String AssignedLevelKeyPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'assignedLevelKey',
        lower: [AssignedLevelKeyPrefix],
        upper: ['$AssignedLevelKeyPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterWhereClause> assignedLevelKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'assignedLevelKey',
        value: [''],
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterWhereClause> assignedLevelKeyIsNotEmpty() {
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

extension IsarSurveyQusetionModelQueryFilter on QueryBuilder<
    IsarSurveyQusetionModel, IsarSurveyQusetionModel, QFilterCondition> {
  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> assignedLevelKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assignedLevelKey',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> assignedLevelKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assignedLevelKey',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
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

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
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

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
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

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
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

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
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

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
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

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
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

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
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

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> assignedLevelKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedLevelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> assignedLevelKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assignedLevelKey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> categoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> categoryLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'category',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'category',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'category',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> categoryLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'category',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> categoryLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'category',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> categoryLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'category',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
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

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
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

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
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

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> questionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questions',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> questionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questions',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> questionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> questionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> questionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> questionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> questionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> questionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'questions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> sureveyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sureveyId',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> sureveyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sureveyId',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> sureveyIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sureveyId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> sureveyIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sureveyId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> sureveyIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sureveyId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> sureveyIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sureveyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> surveyNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surveyName',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> surveyNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surveyName',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> surveyNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surveyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> surveyNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surveyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> surveyNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surveyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> surveyNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surveyName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> surveyNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'surveyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> surveyNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'surveyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
          QAfterFilterCondition>
      surveyNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'surveyName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
          QAfterFilterCondition>
      surveyNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'surveyName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> surveyNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surveyName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
      QAfterFilterCondition> surveyNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'surveyName',
        value: '',
      ));
    });
  }
}

extension IsarSurveyQusetionModelQueryObject on QueryBuilder<
    IsarSurveyQusetionModel, IsarSurveyQusetionModel, QFilterCondition> {
  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
          QAfterFilterCondition>
      categoryElement(FilterQuery<IsarSurveyCategory> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'category');
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel,
          QAfterFilterCondition>
      questionsElement(FilterQuery<IsarSurveyQusetion> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'questions');
    });
  }
}

extension IsarSurveyQusetionModelQueryLinks on QueryBuilder<
    IsarSurveyQusetionModel, IsarSurveyQusetionModel, QFilterCondition> {}

extension IsarSurveyQusetionModelQuerySortBy
    on QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QSortBy> {
  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QAfterSortBy>
      sortByAssignedLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QAfterSortBy>
      sortByAssignedLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QAfterSortBy>
      sortBySureveyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sureveyId', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QAfterSortBy>
      sortBySureveyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sureveyId', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QAfterSortBy>
      sortBySurveyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyName', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QAfterSortBy>
      sortBySurveyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyName', Sort.desc);
    });
  }
}

extension IsarSurveyQusetionModelQuerySortThenBy on QueryBuilder<
    IsarSurveyQusetionModel, IsarSurveyQusetionModel, QSortThenBy> {
  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QAfterSortBy>
      thenByAssignedLevelKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelKey', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QAfterSortBy>
      thenByAssignedLevelKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedLevelKey', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QAfterSortBy>
      thenBySureveyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sureveyId', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QAfterSortBy>
      thenBySureveyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sureveyId', Sort.desc);
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QAfterSortBy>
      thenBySurveyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyName', Sort.asc);
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QAfterSortBy>
      thenBySurveyNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyName', Sort.desc);
    });
  }
}

extension IsarSurveyQusetionModelQueryWhereDistinct on QueryBuilder<
    IsarSurveyQusetionModel, IsarSurveyQusetionModel, QDistinct> {
  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QDistinct>
      distinctByAssignedLevelKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignedLevelKey',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QDistinct>
      distinctBySureveyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sureveyId');
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, IsarSurveyQusetionModel, QDistinct>
      distinctBySurveyName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surveyName', caseSensitive: caseSensitive);
    });
  }
}

extension IsarSurveyQusetionModelQueryProperty on QueryBuilder<
    IsarSurveyQusetionModel, IsarSurveyQusetionModel, QQueryProperty> {
  QueryBuilder<IsarSurveyQusetionModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, String?, QQueryOperations>
      assignedLevelKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignedLevelKey');
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, List<IsarSurveyCategory>?,
      QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, List<IsarSurveyQusetion>?,
      QQueryOperations> questionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questions');
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, int?, QQueryOperations>
      sureveyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sureveyId');
    });
  }

  QueryBuilder<IsarSurveyQusetionModel, String?, QQueryOperations>
      surveyNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surveyName');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IsarSurveyQusetionSchema = Schema(
  name: r'IsarSurveyQusetion',
  id: 1958551181809758492,
  properties: {
    r'colorcode': PropertySchema(
      id: 0,
      name: r'colorcode',
      type: IsarType.long,
    ),
    r'hint': PropertySchema(
      id: 1,
      name: r'hint',
      type: IsarType.string,
    ),
    r'isCounter': PropertySchema(
      id: 2,
      name: r'isCounter',
      type: IsarType.bool,
    ),
    r'isquestionVisble': PropertySchema(
      id: 3,
      name: r'isquestionVisble',
      type: IsarType.bool,
    ),
    r'parentQuestionId': PropertySchema(
      id: 4,
      name: r'parentQuestionId',
      type: IsarType.string,
    ),
    r'question': PropertySchema(
      id: 5,
      name: r'question',
      type: IsarType.string,
    ),
    r'questionId': PropertySchema(
      id: 6,
      name: r'questionId',
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
  estimateSize: _isarSurveyQusetionEstimateSize,
  serialize: _isarSurveyQusetionSerialize,
  deserialize: _isarSurveyQusetionDeserialize,
  deserializeProp: _isarSurveyQusetionDeserializeProp,
);

int _isarSurveyQusetionEstimateSize(
  IsarSurveyQusetion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.hint;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.parentQuestionId;
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

void _isarSurveyQusetionSerialize(
  IsarSurveyQusetion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.colorcode);
  writer.writeString(offsets[1], object.hint);
  writer.writeBool(offsets[2], object.isCounter);
  writer.writeBool(offsets[3], object.isquestionVisble);
  writer.writeString(offsets[4], object.parentQuestionId);
  writer.writeString(offsets[5], object.question);
  writer.writeLong(offsets[6], object.questionId);
  writer.writeString(offsets[7], object.type);
  writer.writeLong(offsets[8], object.typeId);
}

IsarSurveyQusetion _isarSurveyQusetionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarSurveyQusetion();
  object.colorcode = reader.readLongOrNull(offsets[0]);
  object.hint = reader.readStringOrNull(offsets[1]);
  object.isCounter = reader.readBoolOrNull(offsets[2]);
  object.isquestionVisble = reader.readBoolOrNull(offsets[3]);
  object.parentQuestionId = reader.readStringOrNull(offsets[4]);
  object.question = reader.readStringOrNull(offsets[5]);
  object.questionId = reader.readLongOrNull(offsets[6]);
  object.type = reader.readStringOrNull(offsets[7]);
  object.typeId = reader.readLongOrNull(offsets[8]);
  return object;
}

P _isarSurveyQusetionDeserializeProp<P>(
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
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
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

extension IsarSurveyQusetionQueryFilter
    on QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QFilterCondition> {
  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      colorcodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'colorcode',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      colorcodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'colorcode',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      colorcodeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorcode',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      colorcodeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'colorcode',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      colorcodeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'colorcode',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      colorcodeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'colorcode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      hintIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hint',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      hintIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hint',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      hintEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      hintGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      hintLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      hintBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      hintStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      hintEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      hintContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      hintMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      hintIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hint',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      hintIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hint',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      isCounterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isCounter',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      isCounterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isCounter',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      isCounterEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCounter',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      isquestionVisbleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isquestionVisble',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      isquestionVisbleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isquestionVisble',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      isquestionVisbleEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isquestionVisble',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      parentQuestionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentQuestionId',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      parentQuestionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentQuestionId',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      parentQuestionIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentQuestionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      parentQuestionIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentQuestionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      parentQuestionIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentQuestionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      parentQuestionIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentQuestionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      parentQuestionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'parentQuestionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      parentQuestionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'parentQuestionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      parentQuestionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'parentQuestionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      parentQuestionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'parentQuestionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      parentQuestionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentQuestionId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      parentQuestionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'parentQuestionId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      questionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'question',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      questionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'question',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      questionEqualTo(
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

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      questionLessThan(
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

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      questionBetween(
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

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      questionEndsWith(
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

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      questionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'question',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      questionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'question',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      questionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'question',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      questionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'question',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      questionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      questionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      questionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      questionIdBetween(
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

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      typeEqualTo(
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

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      typeGreaterThan(
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

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      typeLessThan(
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

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      typeBetween(
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

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      typeStartsWith(
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

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      typeEndsWith(
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

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      typeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'typeId',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      typeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'typeId',
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      typeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typeId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      typeIdGreaterThan(
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

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      typeIdLessThan(
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

  QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QAfterFilterCondition>
      typeIdBetween(
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

extension IsarSurveyQusetionQueryObject
    on QueryBuilder<IsarSurveyQusetion, IsarSurveyQusetion, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IsarSurveyCategorySchema = Schema(
  name: r'IsarSurveyCategory',
  id: 6443820164992895814,
  properties: {
    r'categoryName': PropertySchema(
      id: 0,
      name: r'categoryName',
      type: IsarType.string,
    ),
    r'colorcode': PropertySchema(
      id: 1,
      name: r'colorcode',
      type: IsarType.long,
    ),
    r'questionId': PropertySchema(
      id: 2,
      name: r'questionId',
      type: IsarType.long,
    ),
    r'surveyId': PropertySchema(
      id: 3,
      name: r'surveyId',
      type: IsarType.long,
    )
  },
  estimateSize: _isarSurveyCategoryEstimateSize,
  serialize: _isarSurveyCategorySerialize,
  deserialize: _isarSurveyCategoryDeserialize,
  deserializeProp: _isarSurveyCategoryDeserializeProp,
);

int _isarSurveyCategoryEstimateSize(
  IsarSurveyCategory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.categoryName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarSurveyCategorySerialize(
  IsarSurveyCategory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.categoryName);
  writer.writeLong(offsets[1], object.colorcode);
  writer.writeLong(offsets[2], object.questionId);
  writer.writeLong(offsets[3], object.surveyId);
}

IsarSurveyCategory _isarSurveyCategoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarSurveyCategory();
  object.categoryName = reader.readStringOrNull(offsets[0]);
  object.colorcode = reader.readLongOrNull(offsets[1]);
  object.questionId = reader.readLongOrNull(offsets[2]);
  object.surveyId = reader.readLongOrNull(offsets[3]);
  return object;
}

P _isarSurveyCategoryDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarSurveyCategoryQueryFilter
    on QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QFilterCondition> {
  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      categoryNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'categoryName',
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      categoryNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'categoryName',
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      categoryNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      categoryNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      categoryNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      categoryNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoryName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      categoryNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      categoryNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      categoryNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      categoryNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoryName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      categoryNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      categoryNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      colorcodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'colorcode',
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      colorcodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'colorcode',
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      colorcodeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorcode',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      colorcodeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'colorcode',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      colorcodeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'colorcode',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      colorcodeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'colorcode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      questionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      questionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      questionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      questionIdBetween(
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

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      surveyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surveyId',
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      surveyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surveyId',
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      surveyIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surveyId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
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

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      surveyIdLessThan(
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

  QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QAfterFilterCondition>
      surveyIdBetween(
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
}

extension IsarSurveyCategoryQueryObject
    on QueryBuilder<IsarSurveyCategory, IsarSurveyCategory, QFilterCondition> {}
