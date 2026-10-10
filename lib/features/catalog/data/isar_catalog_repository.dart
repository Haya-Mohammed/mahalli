import 'package:flutter/foundation.dart';
import 'package:isar_community/isar.dart';
import 'package:mahalli/core/database/collections/category.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/database/collections/product.dart';
import 'package:mahalli/core/database/collections/stock_expense.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/catalog/domain/models/catalog_item.dart';
import 'package:mahalli/features/catalog/domain/models/catalog_page_result.dart';
import 'package:mahalli/features/catalog/domain/models/product_input.dart';
import 'package:mahalli/features/catalog/domain/models/service_input.dart';

import '../domain/catalog_validation.dart';
import '../domain/repository/catalog_repository.dart';

class IsarCatalogRepository implements CatalogRepository {
  const IsarCatalogRepository(this.isar);
  final Isar isar;

  @override
  Future<CatalogPageResult> search({
    required ItemType type,
    required String query,
    required bool includeInactive,
    required int offset,
    required int limit,
  }) async {
    final needle = query.trim();
    try {
      if (type == ItemType.product) {
        var filtered = isar.products.filter().idGreaterThan(-1);
        if (!includeInactive) filtered = filtered.isActiveEqualTo(true);
        if (needle.isNotEmpty) {
          filtered = filtered.group(
            (q) => q
                .nameContains(needle, caseSensitive: false)
                .or()
                .barcodeContains(needle, caseSensitive: false)
                .or()
                .skuContains(needle, caseSensitive: false),
          );
        }
        final rows = await filtered.sortByName().offset(offset).limit(limit + 1).findAll();
        return CatalogPageResult(rows.take(limit).map(_product).toList(), rows.length > limit);
      }
      var filtered = isar.services.filter().idGreaterThan(-1);
      if (!includeInactive) filtered = filtered.isActiveEqualTo(true);
      if (needle.isNotEmpty) {
        filtered = filtered.nameContains(needle, caseSensitive: false);
      }
      final rows = await filtered.sortByName().offset(offset).limit(limit + 1).findAll();
      return CatalogPageResult(rows.take(limit).map(_service).toList(), rows.length > limit);
    } catch (error, stackTrace) {
      debugPrint('Catalog search failed for ${type.name}: $error\n$stackTrace');
      throw const DatabaseFailure('Unable to search catalog');
    }
  }

  @override
  Future<CatalogItem?> get(ItemType type, int id) async {
    try {
      if (type == ItemType.product) {
        final row = await isar.products.get(id);
        return row == null ? null : _product(row);
      }
      final row = await isar.services.get(id);
      return row == null ? null : _service(row);
    } catch (_) {
      throw const DatabaseFailure('Unable to load catalog item');
    }
  }

  @override
  Future<CatalogItem?> getByBarcode(String barcode) async {
    final value = barcode.trim();
    if (value.isEmpty) return null;
    try {
      final row = await isar.products.where().barcodeEqualTo(value).findFirst();
      return row == null ? null : _product(row);
    } catch (_) {
      throw const DatabaseFailure('Unable to look up barcode');
    }
  }

  @override
  Future<CatalogItem> saveProduct(ProductInput input, {int? id}) async {
    validateProduct(input);
    try {
      return await isar.writeTxn(() async {
        final previous = id == null ? null : await isar.products.get(id);
        if (id != null && previous == null) {
          throw const NotFoundFailure('Product not found');
        }
        if (id != null && input.openingStockMilli != 0) {
          throw const ValidationFailure('Stock cannot be changed in product edit');
        }
        await _checkCategory(
          input.categoryId,
          ItemType.product,
          existingCategoryId: previous?.categoryId,
        );
        final barcode = _optional(input.barcode);
        if (barcode != null) {
          final duplicate = await isar.products.where().barcodeEqualTo(barcode).findFirst();
          if (duplicate != null && duplicate.id != id) {
            throw DuplicateBarcodeFailure(barcode);
          }
        }
        final row = previous ?? Product();
        row
          ..name = input.name.trim()
          ..barcode = barcode
          ..sku = _optional(input.sku)
          ..categoryId = input.categoryId
          ..purchasePrice = input.purchasePrice
          ..sellingPrice = input.sellingPrice
          ..unit = input.unit
          ..lowStockThresholdMilli = input.lowStockThresholdMilli
          ..updatedAt = DateTime.now();
        if (previous == null) row.stockMilli = input.openingStockMilli;
        row.id = await isar.products.put(row);
        if (previous == null && input.openingStockMilli > 0) {
          await isar.stockMovements.put(
            StockMovement()
              ..productId = row.id
              ..type = StockMovementType.opening
              ..quantityMilli = input.openingStockMilli,
          );
        }
        return _product(row);
      });
    } on Failure {
      rethrow;
    } catch (_) {
      throw const DatabaseFailure('Unable to save product');
    }
  }

  @override
  Future<CatalogItem> saveService(ServiceInput input, {int? id}) async {
    validateService(input);
    try {
      return await isar.writeTxn(() async {
        final previous = id == null ? null : await isar.services.get(id);
        if (id != null && previous == null) {
          throw const NotFoundFailure('Service not found');
        }
        await _checkCategory(
          input.categoryId,
          ItemType.service,
          existingCategoryId: previous?.categoryId,
        );
        final row = previous ?? Service();
        row
          ..name = input.name.trim()
          ..categoryId = input.categoryId
          ..cost = input.cost
          ..sellingPrice = input.sellingPrice
          ..updatedAt = DateTime.now();
        row.id = await isar.services.put(row);
        return _service(row);
      });
    } on Failure {
      rethrow;
    } catch (_) {
      throw const DatabaseFailure('Unable to save service');
    }
  }

  @override
  Future<void> setActive(ItemType type, int id, bool active) async {
    try {
      await isar.writeTxn(() async {
        if (type == ItemType.product) {
          final row = await isar.products.get(id);
          if (row == null) throw const NotFoundFailure('Product not found');
          row.isActive = active;
          row.updatedAt = DateTime.now();
          await isar.products.put(row);
        } else {
          final row = await isar.services.get(id);
          if (row == null) throw const NotFoundFailure('Service not found');
          row.isActive = active;
          row.updatedAt = DateTime.now();
          await isar.services.put(row);
        }
      });
    } on Failure {
      rethrow;
    } catch (_) {
      throw const DatabaseFailure('Unable to update catalog item');
    }
  }

  Future<void> _checkCategory(int? id, ItemType type, {int? existingCategoryId}) async {
    if (id == null) return;
    final row = await isar.categories.get(id);
    if (row == null || row.type != type || (!row.isActive && id != existingCategoryId)) {
      throw const ValidationFailure('Invalid category');
    }
  }

  String? _optional(String? value) {
    final trimmed = value?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }

  CatalogItem _product(Product row) => CatalogItem(
    id: row.id,
    type: ItemType.product,
    name: row.name,
    sellingPrice: row.sellingPrice,
    cost: row.purchasePrice,
    isActive: row.isActive,
    categoryId: row.categoryId,
    barcode: row.barcode,
    sku: row.sku,
    unit: row.unit,
    stockMilli: row.stockMilli,
    lowStockThresholdMilli: row.lowStockThresholdMilli,
  );

  CatalogItem _service(Service row) => CatalogItem(
    id: row.id,
    type: ItemType.service,
    name: row.name,
    sellingPrice: row.sellingPrice,
    cost: row.cost,
    isActive: row.isActive,
    categoryId: row.categoryId,
  );
}
