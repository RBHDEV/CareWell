// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Nurse.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNurseCollection on Isar {
  IsarCollection<Nurse> get nurses => this.collection();
}

const NurseSchema = CollectionSchema(
  name: r'Nurse',
  id: 8930816105622082759,
  properties: {
    r'Location': PropertySchema(
      id: 0,
      name: r'Location',
      type: IsarType.string,
    ),
    r'Speciality': PropertySchema(
      id: 1,
      name: r'Speciality',
      type: IsarType.string,
    ),
    r'YearsofExperience': PropertySchema(
      id: 2,
      name: r'YearsofExperience',
      type: IsarType.long,
    ),
    r'isAvailable': PropertySchema(
      id: 3,
      name: r'isAvailable',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _nurseEstimateSize,
  serialize: _nurseSerialize,
  deserialize: _nurseDeserialize,
  deserializeProp: _nurseDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _nurseGetId,
  getLinks: _nurseGetLinks,
  attach: _nurseAttach,
  version: '3.1.0+1',
);

int _nurseEstimateSize(
  Nurse object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.Location.length * 3;
  bytesCount += 3 + object.Speciality.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _nurseSerialize(
  Nurse object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.Location);
  writer.writeString(offsets[1], object.Speciality);
  writer.writeString(offsets[2], object.YearsofExperience);
  writer.writeBool(offsets[3], object.isAvailable);
  writer.writeString(offsets[4], object.name);
}

Nurse _nurseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Nurse();
  object.Location = reader.readString(offsets[0]);
  object.Speciality = reader.readString(offsets[1]);
  object.YearsofExperience = reader.readString(offsets[2]);
  object.id = id;
  object.isAvailable = reader.readBool(offsets[3]);
  object.name = reader.readString(offsets[4]);
  return object;
}

P _nurseDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _nurseGetId(Nurse object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _nurseGetLinks(Nurse object) {
  return [];
}

void _nurseAttach(IsarCollection<dynamic> col, Id id, Nurse object) {
  object.id = id;
}

extension NurseQueryWhereSort on QueryBuilder<Nurse, Nurse, QWhere> {
  QueryBuilder<Nurse, Nurse, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NurseQueryWhere on QueryBuilder<Nurse, Nurse, QWhereClause> {
  QueryBuilder<Nurse, Nurse, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Nurse, Nurse, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterWhereClause> idBetween(
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

extension NurseQueryFilter on QueryBuilder<Nurse, Nurse, QFilterCondition> {
  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> locationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> locationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> locationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> locationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Location',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> locationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> locationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> locationContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> locationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Location',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> locationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Location',
        value: '',
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> locationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Location',
        value: '',
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> specialityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Speciality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> specialityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Speciality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> specialityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Speciality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> specialityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Speciality',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> specialityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Speciality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> specialityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Speciality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> specialityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Speciality',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> specialityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Speciality',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> specialityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Speciality',
        value: '',
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> specialityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Speciality',
        value: '',
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> yearsofExperienceEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'YearsofExperience',
        value: value,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition>
      yearsofExperienceGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'YearsofExperience',
        value: value,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> yearsofExperienceLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'YearsofExperience',
        value: value,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> yearsofExperienceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'YearsofExperience',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> isAvailableEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isAvailable',
        value: value,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension NurseQueryObject on QueryBuilder<Nurse, Nurse, QFilterCondition> {}

extension NurseQueryLinks on QueryBuilder<Nurse, Nurse, QFilterCondition> {}

extension NurseQuerySortBy on QueryBuilder<Nurse, Nurse, QSortBy> {
  QueryBuilder<Nurse, Nurse, QAfterSortBy> sortByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Location', Sort.asc);
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterSortBy> sortByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Location', Sort.desc);
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterSortBy> sortBySpeciality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Speciality', Sort.asc);
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterSortBy> sortBySpecialityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Speciality', Sort.desc);
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterSortBy> sortByYearsofExperience() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'YearsofExperience', Sort.asc);
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterSortBy> sortByYearsofExperienceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'YearsofExperience', Sort.desc);
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterSortBy> sortByIsAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAvailable', Sort.asc);
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterSortBy> sortByIsAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAvailable', Sort.desc);
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension NurseQuerySortThenBy on QueryBuilder<Nurse, Nurse, QSortThenBy> {
  QueryBuilder<Nurse, Nurse, QAfterSortBy> thenByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Location', Sort.asc);
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterSortBy> thenByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Location', Sort.desc);
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterSortBy> thenBySpeciality() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Speciality', Sort.asc);
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterSortBy> thenBySpecialityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Speciality', Sort.desc);
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterSortBy> thenByYearsofExperience() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'YearsofExperience', Sort.asc);
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterSortBy> thenByYearsofExperienceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'YearsofExperience', Sort.desc);
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterSortBy> thenByIsAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAvailable', Sort.asc);
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterSortBy> thenByIsAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAvailable', Sort.desc);
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Nurse, Nurse, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension NurseQueryWhereDistinct on QueryBuilder<Nurse, Nurse, QDistinct> {
  QueryBuilder<Nurse, Nurse, QDistinct> distinctByLocation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Location', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Nurse, Nurse, QDistinct> distinctBySpeciality(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Speciality', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Nurse, Nurse, QDistinct> distinctByYearsofExperience() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'YearsofExperience');
    });
  }

  QueryBuilder<Nurse, Nurse, QDistinct> distinctByIsAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isAvailable');
    });
  }

  QueryBuilder<Nurse, Nurse, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension NurseQueryProperty on QueryBuilder<Nurse, Nurse, QQueryProperty> {
  QueryBuilder<Nurse, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Nurse, String, QQueryOperations> LocationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Location');
    });
  }

  QueryBuilder<Nurse, String, QQueryOperations> SpecialityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Speciality');
    });
  }

  QueryBuilder<Nurse, int, QQueryOperations> YearsofExperienceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'YearsofExperience');
    });
  }

  QueryBuilder<Nurse, bool, QQueryOperations> isAvailableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isAvailable');
    });
  }

  QueryBuilder<Nurse, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}
