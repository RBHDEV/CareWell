// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Medical.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMedicalCollection on Isar {
  IsarCollection<Medical> get medicals => this.collection();
}

const MedicalSchema = CollectionSchema(
  name: r'Medical',
  id: 6862942340969368873,
  properties: {
    r'age': PropertySchema(
      id: 0,
      name: r'age',
      type: IsarType.long,
    ),
    r'disease': PropertySchema(
      id: 1,
      name: r'disease',
      type: IsarType.string,
    ),
    r'isHopitalized': PropertySchema(
      id: 2,
      name: r'isHopitalized',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _medicalEstimateSize,
  serialize: _medicalSerialize,
  deserialize: _medicalDeserialize,
  deserializeProp: _medicalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _medicalGetId,
  getLinks: _medicalGetLinks,
  attach: _medicalAttach,
  version: '3.1.0+1',
);

int _medicalEstimateSize(
  Medical object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.disease.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _medicalSerialize(
  Medical object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.age);
  writer.writeString(offsets[1], object.disease);
  writer.writeBool(offsets[2], object.isHopitalized);
  writer.writeString(offsets[3], object.name);
}

Medical _medicalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Medical();
  object.age = reader.readLong(offsets[0]);
  object.disease = reader.readString(offsets[1]);
  object.id = id;
  object.isHopitalized = reader.readBool(offsets[2]);
  object.name = reader.readString(offsets[3]);
  return object;
}

P _medicalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _medicalGetId(Medical object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _medicalGetLinks(Medical object) {
  return [];
}

void _medicalAttach(IsarCollection<dynamic> col, Id id, Medical object) {
  object.id = id;
}

extension MedicalQueryWhereSort on QueryBuilder<Medical, Medical, QWhere> {
  QueryBuilder<Medical, Medical, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MedicalQueryWhere on QueryBuilder<Medical, Medical, QWhereClause> {
  QueryBuilder<Medical, Medical, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Medical, Medical, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Medical, Medical, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Medical, Medical, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Medical, Medical, QAfterWhereClause> idBetween(
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
}

extension MedicalQueryFilter
    on QueryBuilder<Medical, Medical, QFilterCondition> {
  QueryBuilder<Medical, Medical, QAfterFilterCondition> ageEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<Medical, Medical, QAfterFilterCondition> ageGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<Medical, Medical, QAfterFilterCondition> ageLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<Medical, Medical, QAfterFilterCondition> ageBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'age',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Medical, Medical, QAfterFilterCondition> diseaseEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disease',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medical, Medical, QAfterFilterCondition> diseaseGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'disease',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medical, Medical, QAfterFilterCondition> diseaseLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'disease',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medical, Medical, QAfterFilterCondition> diseaseBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'disease',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medical, Medical, QAfterFilterCondition> diseaseStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'disease',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medical, Medical, QAfterFilterCondition> diseaseEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'disease',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medical, Medical, QAfterFilterCondition> diseaseContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'disease',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medical, Medical, QAfterFilterCondition> diseaseMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'disease',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medical, Medical, QAfterFilterCondition> diseaseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disease',
        value: '',
      ));
    });
  }

  QueryBuilder<Medical, Medical, QAfterFilterCondition> diseaseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'disease',
        value: '',
      ));
    });
  }

  QueryBuilder<Medical, Medical, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Medical, Medical, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Medical, Medical, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Medical, Medical, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Medical, Medical, QAfterFilterCondition> isHopitalizedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isHopitalized',
        value: value,
      ));
    });
  }

  QueryBuilder<Medical, Medical, QAfterFilterCondition> nameEqualTo(
    String value, {
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

  QueryBuilder<Medical, Medical, QAfterFilterCondition> nameGreaterThan(
    String value, {
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

  QueryBuilder<Medical, Medical, QAfterFilterCondition> nameLessThan(
    String value, {
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

  QueryBuilder<Medical, Medical, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
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

  QueryBuilder<Medical, Medical, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Medical, Medical, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Medical, Medical, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Medical, Medical, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Medical, Medical, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Medical, Medical, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension MedicalQueryObject
    on QueryBuilder<Medical, Medical, QFilterCondition> {}

extension MedicalQueryLinks
    on QueryBuilder<Medical, Medical, QFilterCondition> {}

extension MedicalQuerySortBy on QueryBuilder<Medical, Medical, QSortBy> {
  QueryBuilder<Medical, Medical, QAfterSortBy> sortByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<Medical, Medical, QAfterSortBy> sortByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<Medical, Medical, QAfterSortBy> sortByDisease() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disease', Sort.asc);
    });
  }

  QueryBuilder<Medical, Medical, QAfterSortBy> sortByDiseaseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disease', Sort.desc);
    });
  }

  QueryBuilder<Medical, Medical, QAfterSortBy> sortByIsHopitalized() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHopitalized', Sort.asc);
    });
  }

  QueryBuilder<Medical, Medical, QAfterSortBy> sortByIsHopitalizedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHopitalized', Sort.desc);
    });
  }

  QueryBuilder<Medical, Medical, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Medical, Medical, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MedicalQuerySortThenBy
    on QueryBuilder<Medical, Medical, QSortThenBy> {
  QueryBuilder<Medical, Medical, QAfterSortBy> thenByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<Medical, Medical, QAfterSortBy> thenByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<Medical, Medical, QAfterSortBy> thenByDisease() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disease', Sort.asc);
    });
  }

  QueryBuilder<Medical, Medical, QAfterSortBy> thenByDiseaseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disease', Sort.desc);
    });
  }

  QueryBuilder<Medical, Medical, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Medical, Medical, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Medical, Medical, QAfterSortBy> thenByIsHopitalized() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHopitalized', Sort.asc);
    });
  }

  QueryBuilder<Medical, Medical, QAfterSortBy> thenByIsHopitalizedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHopitalized', Sort.desc);
    });
  }

  QueryBuilder<Medical, Medical, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Medical, Medical, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension MedicalQueryWhereDistinct
    on QueryBuilder<Medical, Medical, QDistinct> {
  QueryBuilder<Medical, Medical, QDistinct> distinctByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'age');
    });
  }

  QueryBuilder<Medical, Medical, QDistinct> distinctByDisease(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'disease', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Medical, Medical, QDistinct> distinctByIsHopitalized() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isHopitalized');
    });
  }

  QueryBuilder<Medical, Medical, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension MedicalQueryProperty
    on QueryBuilder<Medical, Medical, QQueryProperty> {
  QueryBuilder<Medical, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Medical, int, QQueryOperations> ageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'age');
    });
  }

  QueryBuilder<Medical, String, QQueryOperations> diseaseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'disease');
    });
  }

  QueryBuilder<Medical, bool, QQueryOperations> isHopitalizedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isHopitalized');
    });
  }

  QueryBuilder<Medical, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
