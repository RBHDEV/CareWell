// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Patients.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPatientsCollection on Isar {
  IsarCollection<Patients> get patients => this.collection();
}

const PatientsSchema = CollectionSchema(
  name: r'Patients',
  id: -1210892311855031400,
  properties: {
    r'age': PropertySchema(
      id: 0,
      name: r'age',
      type: IsarType.string,
    ),
    r'dateofbook': PropertySchema(
      id: 1,
      name: r'dateofbook',
      type: IsarType.dateTime,
    ),
    r'disease': PropertySchema(
      id: 2,
      name: r'disease',
      type: IsarType.string,
    ),
    r'isHopitalized': PropertySchema(
      id: 3,
      name: r'isHopitalized',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _patientsEstimateSize,
  serialize: _patientsSerialize,
  deserialize: _patientsDeserialize,
  deserializeProp: _patientsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _patientsGetId,
  getLinks: _patientsGetLinks,
  attach: _patientsAttach,
  version: '3.1.0+1',
);

int _patientsEstimateSize(
  Patients object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.age.length * 3;
  bytesCount += 3 + object.disease.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _patientsSerialize(
  Patients object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.age);
  writer.writeDateTime(offsets[1], object.dateofbook);
  writer.writeString(offsets[2], object.disease);
  writer.writeBool(offsets[3], object.isHopitalized);
  writer.writeString(offsets[4], object.name);
}

Patients _patientsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Patients();
  object.age = reader.readString(offsets[0]);
  object.dateofbook = reader.readDateTime(offsets[1]);
  object.disease = reader.readString(offsets[2]);
  object.id = id;
  object.isHopitalized = reader.readBool(offsets[3]);
  object.name = reader.readString(offsets[4]);
  return object;
}

P _patientsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _patientsGetId(Patients object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _patientsGetLinks(Patients object) {
  return [];
}

void _patientsAttach(IsarCollection<dynamic> col, Id id, Patients object) {
  object.id = id;
}

extension PatientsQueryWhereSort on QueryBuilder<Patients, Patients, QWhere> {
  QueryBuilder<Patients, Patients, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PatientsQueryWhere on QueryBuilder<Patients, Patients, QWhereClause> {
  QueryBuilder<Patients, Patients, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Patients, Patients, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Patients, Patients, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Patients, Patients, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Patients, Patients, QAfterWhereClause> idBetween(
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

extension PatientsQueryFilter
    on QueryBuilder<Patients, Patients, QFilterCondition> {
  QueryBuilder<Patients, Patients, QAfterFilterCondition> ageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'age',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patients, Patients, QAfterFilterCondition> ageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'age',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patients, Patients, QAfterFilterCondition> ageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'age',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patients, Patients, QAfterFilterCondition> ageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'age',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patients, Patients, QAfterFilterCondition> ageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'age',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patients, Patients, QAfterFilterCondition> ageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'age',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patients, Patients, QAfterFilterCondition> ageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'age',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patients, Patients, QAfterFilterCondition> ageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'age',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Patients, Patients, QAfterFilterCondition> ageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'age',
        value: '',
      ));
    });
  }

  QueryBuilder<Patients, Patients, QAfterFilterCondition> ageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'age',
        value: '',
      ));
    });
  }

  QueryBuilder<Patients, Patients, QAfterFilterCondition> dateofbookEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateofbook',
        value: value,
      ));
    });
  }

  QueryBuilder<Patients, Patients, QAfterFilterCondition> dateofbookGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateofbook',
        value: value,
      ));
    });
  }

  QueryBuilder<Patients, Patients, QAfterFilterCondition> dateofbookLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateofbook',
        value: value,
      ));
    });
  }

  QueryBuilder<Patients, Patients, QAfterFilterCondition> dateofbookBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateofbook',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Patients, Patients, QAfterFilterCondition> diseaseEqualTo(
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

  QueryBuilder<Patients, Patients, QAfterFilterCondition> diseaseGreaterThan(
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

  QueryBuilder<Patients, Patients, QAfterFilterCondition> diseaseLessThan(
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

  QueryBuilder<Patients, Patients, QAfterFilterCondition> diseaseBetween(
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

  QueryBuilder<Patients, Patients, QAfterFilterCondition> diseaseStartsWith(
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

  QueryBuilder<Patients, Patients, QAfterFilterCondition> diseaseEndsWith(
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

  QueryBuilder<Patients, Patients, QAfterFilterCondition> diseaseContains(
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

  QueryBuilder<Patients, Patients, QAfterFilterCondition> diseaseMatches(
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

  QueryBuilder<Patients, Patients, QAfterFilterCondition> diseaseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'disease',
        value: '',
      ));
    });
  }

  QueryBuilder<Patients, Patients, QAfterFilterCondition> diseaseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'disease',
        value: '',
      ));
    });
  }

  QueryBuilder<Patients, Patients, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Patients, Patients, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Patients, Patients, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Patients, Patients, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Patients, Patients, QAfterFilterCondition> isHopitalizedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isHopitalized',
        value: value,
      ));
    });
  }

  QueryBuilder<Patients, Patients, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Patients, Patients, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Patients, Patients, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Patients, Patients, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Patients, Patients, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Patients, Patients, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Patients, Patients, QAfterFilterCondition> nameContains(
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

  QueryBuilder<Patients, Patients, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Patients, Patients, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Patients, Patients, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension PatientsQueryObject
    on QueryBuilder<Patients, Patients, QFilterCondition> {}

extension PatientsQueryLinks
    on QueryBuilder<Patients, Patients, QFilterCondition> {}

extension PatientsQuerySortBy on QueryBuilder<Patients, Patients, QSortBy> {
  QueryBuilder<Patients, Patients, QAfterSortBy> sortByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<Patients, Patients, QAfterSortBy> sortByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<Patients, Patients, QAfterSortBy> sortByDateofbook() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateofbook', Sort.asc);
    });
  }

  QueryBuilder<Patients, Patients, QAfterSortBy> sortByDateofbookDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateofbook', Sort.desc);
    });
  }

  QueryBuilder<Patients, Patients, QAfterSortBy> sortByDisease() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disease', Sort.asc);
    });
  }

  QueryBuilder<Patients, Patients, QAfterSortBy> sortByDiseaseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disease', Sort.desc);
    });
  }

  QueryBuilder<Patients, Patients, QAfterSortBy> sortByIsHopitalized() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHopitalized', Sort.asc);
    });
  }

  QueryBuilder<Patients, Patients, QAfterSortBy> sortByIsHopitalizedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHopitalized', Sort.desc);
    });
  }

  QueryBuilder<Patients, Patients, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Patients, Patients, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension PatientsQuerySortThenBy
    on QueryBuilder<Patients, Patients, QSortThenBy> {
  QueryBuilder<Patients, Patients, QAfterSortBy> thenByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<Patients, Patients, QAfterSortBy> thenByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<Patients, Patients, QAfterSortBy> thenByDateofbook() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateofbook', Sort.asc);
    });
  }

  QueryBuilder<Patients, Patients, QAfterSortBy> thenByDateofbookDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateofbook', Sort.desc);
    });
  }

  QueryBuilder<Patients, Patients, QAfterSortBy> thenByDisease() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disease', Sort.asc);
    });
  }

  QueryBuilder<Patients, Patients, QAfterSortBy> thenByDiseaseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disease', Sort.desc);
    });
  }

  QueryBuilder<Patients, Patients, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Patients, Patients, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Patients, Patients, QAfterSortBy> thenByIsHopitalized() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHopitalized', Sort.asc);
    });
  }

  QueryBuilder<Patients, Patients, QAfterSortBy> thenByIsHopitalizedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isHopitalized', Sort.desc);
    });
  }

  QueryBuilder<Patients, Patients, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Patients, Patients, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension PatientsQueryWhereDistinct
    on QueryBuilder<Patients, Patients, QDistinct> {
  QueryBuilder<Patients, Patients, QDistinct> distinctByAge(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'age', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Patients, Patients, QDistinct> distinctByDateofbook() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateofbook');
    });
  }

  QueryBuilder<Patients, Patients, QDistinct> distinctByDisease(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'disease', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Patients, Patients, QDistinct> distinctByIsHopitalized() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isHopitalized');
    });
  }

  QueryBuilder<Patients, Patients, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension PatientsQueryProperty
    on QueryBuilder<Patients, Patients, QQueryProperty> {
  QueryBuilder<Patients, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Patients, String, QQueryOperations> ageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'age');
    });
  }

  QueryBuilder<Patients, DateTime, QQueryOperations> dateofbookProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateofbook');
    });
  }

  QueryBuilder<Patients, String, QQueryOperations> diseaseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'disease');
    });
  }

  QueryBuilder<Patients, bool, QQueryOperations> isHopitalizedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isHopitalized');
    });
  }

  QueryBuilder<Patients, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
