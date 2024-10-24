// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dropdown_options_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarMultiDropdownOptionModelCollection on Isar {
  IsarCollection<IsarMultiDropdownOptionModel>
      get isarMultiDropdownOptionModels => this.collection();
}

const IsarMultiDropdownOptionModelSchema = CollectionSchema(
  name: r'IsarMultiDropdownOptionModel',
  id: -4426844972140372721,
  properties: {
    r'levelkey': PropertySchema(
      id: 0,
      name: r'levelkey',
      type: IsarType.string,
    ),
    r'nestedOptions': PropertySchema(
      id: 1,
      name: r'nestedOptions',
      type: IsarType.objectList,
      target: r'IsarChildOption',
    ),
    r'options': PropertySchema(
      id: 2,
      name: r'options',
      type: IsarType.objectList,
      target: r'IsarChildOption',
    ),
    r'surveyId': PropertySchema(
      id: 3,
      name: r'surveyId',
      type: IsarType.long,
    )
  },
  estimateSize: _isarMultiDropdownOptionModelEstimateSize,
  serialize: _isarMultiDropdownOptionModelSerialize,
  deserialize: _isarMultiDropdownOptionModelDeserialize,
  deserializeProp: _isarMultiDropdownOptionModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'levelkey': IndexSchema(
      id: 1542035306984987502,
      name: r'levelkey',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'levelkey',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'IsarChildOption': IsarChildOptionSchema},
  getId: _isarMultiDropdownOptionModelGetId,
  getLinks: _isarMultiDropdownOptionModelGetLinks,
  attach: _isarMultiDropdownOptionModelAttach,
  version: '3.1.0+1',
);

int _isarMultiDropdownOptionModelEstimateSize(
  IsarMultiDropdownOptionModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.levelkey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.nestedOptions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[IsarChildOption]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              IsarChildOptionSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.options;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[IsarChildOption]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              IsarChildOptionSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _isarMultiDropdownOptionModelSerialize(
  IsarMultiDropdownOptionModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.levelkey);
  writer.writeObjectList<IsarChildOption>(
    offsets[1],
    allOffsets,
    IsarChildOptionSchema.serialize,
    object.nestedOptions,
  );
  writer.writeObjectList<IsarChildOption>(
    offsets[2],
    allOffsets,
    IsarChildOptionSchema.serialize,
    object.options,
  );
  writer.writeLong(offsets[3], object.surveyId);
}

IsarMultiDropdownOptionModel _isarMultiDropdownOptionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarMultiDropdownOptionModel();
  object.id = id;
  object.levelkey = reader.readStringOrNull(offsets[0]);
  object.nestedOptions = reader.readObjectList<IsarChildOption>(
    offsets[1],
    IsarChildOptionSchema.deserialize,
    allOffsets,
    IsarChildOption(),
  );
  object.options = reader.readObjectList<IsarChildOption>(
    offsets[2],
    IsarChildOptionSchema.deserialize,
    allOffsets,
    IsarChildOption(),
  );
  object.surveyId = reader.readLongOrNull(offsets[3]);
  return object;
}

P _isarMultiDropdownOptionModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<IsarChildOption>(
        offset,
        IsarChildOptionSchema.deserialize,
        allOffsets,
        IsarChildOption(),
      )) as P;
    case 2:
      return (reader.readObjectList<IsarChildOption>(
        offset,
        IsarChildOptionSchema.deserialize,
        allOffsets,
        IsarChildOption(),
      )) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarMultiDropdownOptionModelGetId(IsarMultiDropdownOptionModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarMultiDropdownOptionModelGetLinks(
    IsarMultiDropdownOptionModel object) {
  return [];
}

void _isarMultiDropdownOptionModelAttach(
    IsarCollection<dynamic> col, Id id, IsarMultiDropdownOptionModel object) {
  object.id = id;
}

extension IsarMultiDropdownOptionModelQueryWhereSort on QueryBuilder<
    IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel, QWhere> {
  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterWhere> anyLevelkey() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'levelkey'),
      );
    });
  }
}

extension IsarMultiDropdownOptionModelQueryWhere on QueryBuilder<
    IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel, QWhereClause> {
  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
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

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
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

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterWhereClause> levelkeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'levelkey',
        value: [null],
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterWhereClause> levelkeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'levelkey',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterWhereClause> levelkeyEqualTo(String? levelkey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'levelkey',
        value: [levelkey],
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterWhereClause> levelkeyNotEqualTo(String? levelkey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'levelkey',
              lower: [],
              upper: [levelkey],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'levelkey',
              lower: [levelkey],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'levelkey',
              lower: [levelkey],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'levelkey',
              lower: [],
              upper: [levelkey],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterWhereClause> levelkeyGreaterThan(
    String? levelkey, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'levelkey',
        lower: [levelkey],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterWhereClause> levelkeyLessThan(
    String? levelkey, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'levelkey',
        lower: [],
        upper: [levelkey],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterWhereClause> levelkeyBetween(
    String? lowerLevelkey,
    String? upperLevelkey, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'levelkey',
        lower: [lowerLevelkey],
        includeLower: includeLower,
        upper: [upperLevelkey],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterWhereClause> levelkeyStartsWith(String LevelkeyPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'levelkey',
        lower: [LevelkeyPrefix],
        upper: ['$LevelkeyPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterWhereClause> levelkeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'levelkey',
        value: [''],
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterWhereClause> levelkeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'levelkey',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'levelkey',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'levelkey',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'levelkey',
              upper: [''],
            ));
      }
    });
  }
}

extension IsarMultiDropdownOptionModelQueryFilter on QueryBuilder<
    IsarMultiDropdownOptionModel,
    IsarMultiDropdownOptionModel,
    QFilterCondition> {
  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
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

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
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

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
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

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> levelkeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'levelkey',
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> levelkeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'levelkey',
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> levelkeyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'levelkey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> levelkeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'levelkey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> levelkeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'levelkey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> levelkeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'levelkey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> levelkeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'levelkey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> levelkeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'levelkey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
          QAfterFilterCondition>
      levelkeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'levelkey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
          QAfterFilterCondition>
      levelkeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'levelkey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> levelkeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'levelkey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> levelkeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'levelkey',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> nestedOptionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nestedOptions',
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> nestedOptionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nestedOptions',
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> nestedOptionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nestedOptions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> nestedOptionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nestedOptions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> nestedOptionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nestedOptions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> nestedOptionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nestedOptions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> nestedOptionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nestedOptions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> nestedOptionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nestedOptions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> optionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'options',
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> optionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'options',
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> optionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'options',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> optionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'options',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> optionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'options',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> optionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'options',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> optionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'options',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> optionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'options',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> surveyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surveyId',
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> surveyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surveyId',
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> surveyIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surveyId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
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

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
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

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
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
}

extension IsarMultiDropdownOptionModelQueryObject on QueryBuilder<
    IsarMultiDropdownOptionModel,
    IsarMultiDropdownOptionModel,
    QFilterCondition> {
  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
          QAfterFilterCondition>
      nestedOptionsElement(FilterQuery<IsarChildOption> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'nestedOptions');
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterFilterCondition> optionsElement(FilterQuery<IsarChildOption> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'options');
    });
  }
}

extension IsarMultiDropdownOptionModelQueryLinks on QueryBuilder<
    IsarMultiDropdownOptionModel,
    IsarMultiDropdownOptionModel,
    QFilterCondition> {}

extension IsarMultiDropdownOptionModelQuerySortBy on QueryBuilder<
    IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel, QSortBy> {
  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterSortBy> sortByLevelkey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelkey', Sort.asc);
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterSortBy> sortByLevelkeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelkey', Sort.desc);
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterSortBy> sortBySurveyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyId', Sort.asc);
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterSortBy> sortBySurveyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyId', Sort.desc);
    });
  }
}

extension IsarMultiDropdownOptionModelQuerySortThenBy on QueryBuilder<
    IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel, QSortThenBy> {
  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterSortBy> thenByLevelkey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelkey', Sort.asc);
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterSortBy> thenByLevelkeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelkey', Sort.desc);
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterSortBy> thenBySurveyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyId', Sort.asc);
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QAfterSortBy> thenBySurveyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surveyId', Sort.desc);
    });
  }
}

extension IsarMultiDropdownOptionModelQueryWhereDistinct on QueryBuilder<
    IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel, QDistinct> {
  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QDistinct> distinctByLevelkey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'levelkey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, IsarMultiDropdownOptionModel,
      QDistinct> distinctBySurveyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surveyId');
    });
  }
}

extension IsarMultiDropdownOptionModelQueryProperty on QueryBuilder<
    IsarMultiDropdownOptionModel,
    IsarMultiDropdownOptionModel,
    QQueryProperty> {
  QueryBuilder<IsarMultiDropdownOptionModel, int, QQueryOperations>
      idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, String?, QQueryOperations>
      levelkeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'levelkey');
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, List<IsarChildOption>?,
      QQueryOperations> nestedOptionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nestedOptions');
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, List<IsarChildOption>?,
      QQueryOperations> optionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'options');
    });
  }

  QueryBuilder<IsarMultiDropdownOptionModel, int?, QQueryOperations>
      surveyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surveyId');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IsarChildOptionSchema = Schema(
  name: r'IsarChildOption',
  id: 4242599008666912174,
  properties: {
    r'optionId': PropertySchema(
      id: 0,
      name: r'optionId',
      type: IsarType.long,
    ),
    r'optionValue': PropertySchema(
      id: 1,
      name: r'optionValue',
      type: IsarType.string,
    ),
    r'parentQuestionId': PropertySchema(
      id: 2,
      name: r'parentQuestionId',
      type: IsarType.long,
    ),
    r'questionId': PropertySchema(
      id: 3,
      name: r'questionId',
      type: IsarType.long,
    )
  },
  estimateSize: _isarChildOptionEstimateSize,
  serialize: _isarChildOptionSerialize,
  deserialize: _isarChildOptionDeserialize,
  deserializeProp: _isarChildOptionDeserializeProp,
);

int _isarChildOptionEstimateSize(
  IsarChildOption object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.optionValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarChildOptionSerialize(
  IsarChildOption object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.optionId);
  writer.writeString(offsets[1], object.optionValue);
  writer.writeLong(offsets[2], object.parentQuestionId);
  writer.writeLong(offsets[3], object.questionId);
}

IsarChildOption _isarChildOptionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarChildOption();
  object.optionId = reader.readLongOrNull(offsets[0]);
  object.optionValue = reader.readStringOrNull(offsets[1]);
  object.parentQuestionId = reader.readLongOrNull(offsets[2]);
  object.questionId = reader.readLongOrNull(offsets[3]);
  return object;
}

P _isarChildOptionDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarChildOptionQueryFilter
    on QueryBuilder<IsarChildOption, IsarChildOption, QFilterCondition> {
  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      optionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'optionId',
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      optionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'optionId',
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      optionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'optionId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      optionIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'optionId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      optionIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'optionId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      optionIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'optionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      optionValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'optionValue',
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      optionValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'optionValue',
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      optionValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'optionValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      optionValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'optionValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      optionValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'optionValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      optionValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'optionValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      optionValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'optionValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      optionValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'optionValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      optionValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'optionValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      optionValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'optionValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      optionValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'optionValue',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      optionValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'optionValue',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      parentQuestionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentQuestionId',
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      parentQuestionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentQuestionId',
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      parentQuestionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentQuestionId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      parentQuestionIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentQuestionId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      parentQuestionIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentQuestionId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      parentQuestionIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentQuestionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      questionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      questionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
      questionIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
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

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
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

  QueryBuilder<IsarChildOption, IsarChildOption, QAfterFilterCondition>
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
}

extension IsarChildOptionQueryObject
    on QueryBuilder<IsarChildOption, IsarChildOption, QFilterCondition> {}
