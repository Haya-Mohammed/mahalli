// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetShopCollection on Isar {
  IsarCollection<Shop> get shops => this.collection();
}

const ShopSchema = CollectionSchema(
  name: r'Shop',
  id: -8611931068241789946,
  properties: {
    r'businessType': PropertySchema(
      id: 0,
      name: r'businessType',
      type: IsarType.string,
      enumMap: _ShopbusinessTypeEnumValueMap,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'currency': PropertySchema(
      id: 2,
      name: r'currency',
      type: IsarType.string,
    ),
    r'name': PropertySchema(id: 3, name: r'name', type: IsarType.string),
    r'updatedAt': PropertySchema(
      id: 4,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _shopEstimateSize,
  serialize: _shopSerialize,
  deserialize: _shopDeserialize,
  deserializeProp: _shopDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _shopGetId,
  getLinks: _shopGetLinks,
  attach: _shopAttach,
  version: '3.3.2',
);

int _shopEstimateSize(
  Shop object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.businessType.name.length * 3;
  bytesCount += 3 + object.currency.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _shopSerialize(
  Shop object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.businessType.name);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.currency);
  writer.writeString(offsets[3], object.name);
  writer.writeDateTime(offsets[4], object.updatedAt);
}

Shop _shopDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Shop();
  object.businessType =
      _ShopbusinessTypeValueEnumMap[reader.readStringOrNull(offsets[0])] ??
      BusinessType.grocery;
  object.createdAt = reader.readDateTime(offsets[1]);
  object.currency = reader.readString(offsets[2]);
  object.id = id;
  object.name = reader.readString(offsets[3]);
  object.updatedAt = reader.readDateTime(offsets[4]);
  return object;
}

P _shopDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_ShopbusinessTypeValueEnumMap[reader.readStringOrNull(offset)] ??
              BusinessType.grocery)
          as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ShopbusinessTypeEnumValueMap = {
  r'grocery': r'grocery',
  r'retail': r'retail',
  r'stall': r'stall',
  r'salon': r'salon',
  r'garage': r'garage',
  r'other': r'other',
};
const _ShopbusinessTypeValueEnumMap = {
  r'grocery': BusinessType.grocery,
  r'retail': BusinessType.retail,
  r'stall': BusinessType.stall,
  r'salon': BusinessType.salon,
  r'garage': BusinessType.garage,
  r'other': BusinessType.other,
};

Id _shopGetId(Shop object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _shopGetLinks(Shop object) {
  return [];
}

void _shopAttach(IsarCollection<dynamic> col, Id id, Shop object) {
  object.id = id;
}

extension ShopQueryWhereSort on QueryBuilder<Shop, Shop, QWhere> {
  QueryBuilder<Shop, Shop, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ShopQueryWhere on QueryBuilder<Shop, Shop, QWhereClause> {
  QueryBuilder<Shop, Shop, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Shop, Shop, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Shop, Shop, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ShopQueryFilter on QueryBuilder<Shop, Shop, QFilterCondition> {
  QueryBuilder<Shop, Shop, QAfterFilterCondition> businessTypeEqualTo(
    BusinessType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'businessType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> businessTypeGreaterThan(
    BusinessType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'businessType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> businessTypeLessThan(
    BusinessType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'businessType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> businessTypeBetween(
    BusinessType lower,
    BusinessType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'businessType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> businessTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'businessType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> businessTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'businessType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> businessTypeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'businessType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> businessTypeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'businessType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> businessTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'businessType', value: ''),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> businessTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'businessType', value: ''),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> createdAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> currencyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'currency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> currencyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'currency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> currencyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'currency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> currencyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'currency',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> currencyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'currency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> currencyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'currency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> currencyContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'currency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> currencyMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'currency',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> currencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'currency', value: ''),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> currencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'currency', value: ''),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> nameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> updatedAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Shop, Shop, QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ShopQueryObject on QueryBuilder<Shop, Shop, QFilterCondition> {}

extension ShopQueryLinks on QueryBuilder<Shop, Shop, QFilterCondition> {}

extension ShopQuerySortBy on QueryBuilder<Shop, Shop, QSortBy> {
  QueryBuilder<Shop, Shop, QAfterSortBy> sortByBusinessType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessType', Sort.asc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> sortByBusinessTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessType', Sort.desc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> sortByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> sortByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ShopQuerySortThenBy on QueryBuilder<Shop, Shop, QSortThenBy> {
  QueryBuilder<Shop, Shop, QAfterSortBy> thenByBusinessType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessType', Sort.asc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> thenByBusinessTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessType', Sort.desc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> thenByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> thenByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Shop, Shop, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension ShopQueryWhereDistinct on QueryBuilder<Shop, Shop, QDistinct> {
  QueryBuilder<Shop, Shop, QDistinct> distinctByBusinessType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'businessType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Shop, Shop, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Shop, Shop, QDistinct> distinctByCurrency({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currency', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Shop, Shop, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Shop, Shop, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension ShopQueryProperty on QueryBuilder<Shop, Shop, QQueryProperty> {
  QueryBuilder<Shop, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Shop, BusinessType, QQueryOperations> businessTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'businessType');
    });
  }

  QueryBuilder<Shop, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Shop, String, QQueryOperations> currencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currency');
    });
  }

  QueryBuilder<Shop, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Shop, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
