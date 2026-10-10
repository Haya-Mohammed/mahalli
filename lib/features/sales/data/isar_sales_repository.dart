import 'dart:convert';

import 'package:isar_community/isar.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/database/collections/sale.dart';
import 'package:mahalli/core/database/transaction_runner.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/catalog/domain/models/catalog_item.dart';
import 'package:mahalli/features/catalog/domain/repository/catalog_repository.dart';
import 'package:mahalli/features/customers/domain/repository/customer_repository.dart';
import 'package:mahalli/features/sales/domain/models/cart_line.dart';
import 'package:mahalli/features/sales/domain/models/checkout_input.dart';
import 'package:mahalli/features/sales/domain/models/draft_cart_data.dart';
import 'package:mahalli/features/sales/domain/models/sale_details.dart';
import 'package:mahalli/features/sales/domain/models/sale_summary.dart';
import 'package:mahalli/features/sales/domain/models/sales_page.dart';
import 'package:mahalli/features/stock/domain/repositories/stock_repository.dart';

import '../domain/repositories/sales_repository.dart';
import '../domain/sales_rules.dart';

class IsarSalesRepository implements SalesRepository {
  IsarSalesRepository(this.isar, this.transactions, this.catalog, this.stock, this.customers);
  final Isar isar;
  final TransactionRunner transactions;
  final CatalogRepository catalog;
  final StockRepository stock;
  final CustomerRepository customers;

  @override
  Future<SaleSummary> create(CheckoutInput input) async {
    validateCheckout(input);
    try {
      return await transactions.run(() async {
        final total = cartTotal(input.lines);
        final now = DateTime.now();
        final row = Sale()
          ..customerId = input.customerId
          ..subtotal = total
          ..totalAmount = total
          ..paidAmount = input.paidAmount
          ..remainingAmount = total - input.paidAmount
          ..paymentStatus = paymentStatusFor(total, input.paidAmount)
          ..createdAt = now;
        row.id = await isar.sales.put(row);
        for (final line in input.lines) {
          final current = await catalog.get(line.item.type, line.item.id);
          if (current == null || !current.isActive) {
            throw const NotFoundFailure('Catalog item unavailable');
          }
          await isar.saleItems.put(
            SaleItem()
              ..saleId = row.id
              ..itemId = line.item.id
              ..itemType = line.item.type
              ..itemNameSnapshot = line.item.name
              ..quantityMilli = line.quantityMilli
              ..unitPrice = line.item.sellingPrice
              ..unitCost = line.item.cost
              ..totalPrice = line.totalMinor
              ..createdAt = now,
          );
          if (line.item.type == ItemType.product) {
            await stock.recordInTxn(
              productId: line.item.id,
              deltaMilli: -line.quantityMilli,
              type: StockMovementType.sale,
              referenceId: row.id,
            );
          }
        }
        if (row.remainingAmount > 0) {
          await customers.recordInTxn(
            customerId: row.customerId!,
            type: DebtTxType.saleCredit,
            deltaMinor: row.remainingAmount,
            saleId: row.id,
          );
        }
        await isar.draftCarts.where().deleteAll();
        return _summary(row);
      });
    } on Failure {
      rethrow;
    } catch (_) {
      throw const DatabaseFailure('Unable to create sale');
    }
  }

  @override
  Future<void> saveDraft(List<CartLine> lines, {int? customerId}) => transactions.run(() async {
    final payload = lines
        .map(
          (line) => {
            'id': line.item.id,
            'type': line.item.type.name,
            'quantity': line.quantityMilli,
          },
        )
        .toList();
    final existing = await isar.draftCarts.where().findFirst();
    final row = existing ?? DraftCart();
    row
      ..customerId = customerId
      ..payload = jsonEncode(payload)
      ..updatedAt = DateTime.now();
    await isar.draftCarts.put(row);
  });

  @override
  Future<DraftCartData?> loadDraft() async {
    final row = await isar.draftCarts.where().sortByUpdatedAtDesc().findFirst();
    if (row == null) return null;
    try {
      final decoded = jsonDecode(row.payload) as List<dynamic>;
      final lines = <CartLine>[];
      for (final data in decoded.cast<Map<String, dynamic>>()) {
        final item = await catalog.get(
          ItemType.values.byName(data['type'] as String),
          data['id'] as int,
        );
        if (item != null && item.isActive) {
          lines.add(CartLine(item: item, quantityMilli: data['quantity'] as int));
        }
      }
      return DraftCartData(lines: lines, customerId: row.customerId);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> discardDraft() => transactions.run(() => isar.draftCarts.where().deleteAll());

  @override
  Future<SalesPage> list({required int offset, required int limit}) async {
    final rows = await isar.sales
        .where()
        .sortByCreatedAtDesc()
        .offset(offset)
        .limit(limit + 1)
        .findAll();
    return SalesPage(rows.take(limit).map(_summary).toList(), rows.length > limit);
  }

  @override
  Future<SaleDetails?> details(int saleId) async {
    final sale = await isar.sales.get(saleId);
    if (sale == null) return null;
    final rows = await isar.saleItems.filter().saleIdEqualTo(saleId).findAll();
    final lines = rows
        .map(
          (row) => CartLine(
            item: CatalogItem(
              id: row.itemId,
              type: row.itemType,
              name: row.itemNameSnapshot,
              sellingPrice: row.unitPrice,
              cost: row.unitCost,
              isActive: true,
            ),
            quantityMilli: row.quantityMilli,
          ),
        )
        .toList();
    return SaleDetails(sale: _summary(sale), lines: lines);
  }

  SaleSummary _summary(Sale row) => SaleSummary(
    id: row.id,
    saleNumber: row.id,
    totalAmount: row.totalAmount,
    paidAmount: row.paidAmount,
    remainingAmount: row.remainingAmount,
    paymentStatus: row.paymentStatus,
    createdAt: row.createdAt,
    customerId: row.customerId,
  );
}
