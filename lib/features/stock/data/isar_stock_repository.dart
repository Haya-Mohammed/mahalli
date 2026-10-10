import 'package:isar_community/isar.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/database/collections/product.dart';
import 'package:mahalli/core/database/collections/stock_expense.dart';
import 'package:mahalli/core/database/transaction_runner.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/stock/domain/models/stock_movement_entry.dart';
import 'package:mahalli/features/stock/domain/models/stock_movement_page.dart';
import 'package:mahalli/features/stock/domain/models/stock_product.dart';

import '../domain/repositories/stock_repository.dart';
import '../domain/stock_math.dart';

class IsarStockRepository implements StockRepository {
  const IsarStockRepository(this.isar, this.transactions);
  final Isar isar;
  final TransactionRunner transactions;

  @override
  Future<List<StockProduct>> listProducts() async {
    try {
      final rows = await isar.products.where().findAll();
      rows.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      return rows.map(_product).toList();
    } catch (_) {
      throw const DatabaseFailure('Unable to load stock');
    }
  }

  @override
  Future<StockProduct?> getProduct(int productId) async {
    try {
      final row = await isar.products.get(productId);
      return row == null ? null : _product(row);
    } catch (_) {
      throw const DatabaseFailure('Unable to load product stock');
    }
  }

  @override
  Future<StockMovementPage> getMovements(
    int productId, {
    required int offset,
    required int limit,
  }) async {
    try {
      final rows = await isar.stockMovements
          .filter()
          .productIdEqualTo(productId)
          .sortByCreatedAtDesc()
          .offset(offset)
          .limit(limit + 1)
          .findAll();
      return StockMovementPage(rows.take(limit).map(_movement).toList(), rows.length > limit);
    } catch (_) {
      throw const DatabaseFailure('Unable to load stock movements');
    }
  }

  @override
  Future<StockProduct> addStock(int productId, int quantityMilli, {String? note}) {
    if (quantityMilli <= 0) {
      throw const ValidationFailure('Stock addition must be positive');
    }
    return transactions.run(() async {
      await recordInTxn(
        productId: productId,
        deltaMilli: quantityMilli,
        type: StockMovementType.purchase,
        note: note,
      );
      return _product((await isar.products.get(productId))!);
    });
  }

  @override
  Future<StockProduct> adjustStock(int productId, int targetMilli, {String? note}) {
    if (targetMilli < 0) {
      throw const ValidationFailure('Counted stock cannot be negative');
    }
    return transactions.run(() async {
      final row = await isar.products.get(productId);
      if (row == null) throw const NotFoundFailure('Product not found');
      await recordInTxn(
        productId: productId,
        deltaMilli: adjustmentDelta(row.stockMilli, targetMilli),
        type: StockMovementType.adjustment,
        note: note,
      );
      return _product((await isar.products.get(productId))!);
    });
  }

  @override
  Future<StockProduct> recordDamage(int productId, int quantityMilli, {required String reason}) {
    if (quantityMilli <= 0 || reason.trim().isEmpty) {
      throw const ValidationFailure('Damage quantity and reason required');
    }
    return transactions.run(() async {
      final row = await isar.products.get(productId);
      if (row == null) throw const NotFoundFailure('Product not found');
      await recordInTxn(
        productId: productId,
        deltaMilli: damageDelta(row.stockMilli, quantityMilli),
        type: StockMovementType.damage,
        note: reason.trim(),
      );
      return _product((await isar.products.get(productId))!);
    });
  }

  @override
  Future<void> recordInTxn({
    required int productId,
    required int deltaMilli,
    required StockMovementType type,
    int? referenceId,
    String? note,
  }) async {
    final row = await isar.products.get(productId);
    if (row == null) throw const NotFoundFailure('Product not found');
    final cleanedNote = note?.trim();
    row.stockMilli += deltaMilli;
    row.updatedAt = DateTime.now();
    await isar.products.put(row);
    await isar.stockMovements.put(
      StockMovement()
        ..productId = productId
        ..type = type
        ..quantityMilli = deltaMilli
        ..referenceId = referenceId
        ..note = cleanedNote == null || cleanedNote.isEmpty ? null : cleanedNote,
    );
  }

  StockProduct _product(Product row) => StockProduct(
    id: row.id,
    name: row.name,
    quantityMilli: row.stockMilli,
    thresholdMilli: row.lowStockThresholdMilli,
    unit: row.unit,
    isActive: row.isActive,
    sellingPriceMinor: row.sellingPrice,
    barcode: row.barcode,
    sku: row.sku,
  );

  StockMovementEntry _movement(StockMovement row) => StockMovementEntry(
    id: row.id,
    productId: row.productId,
    type: row.type,
    quantityMilli: row.quantityMilli,
    createdAt: row.createdAt,
    note: row.note,
    referenceId: row.referenceId,
  );
}
