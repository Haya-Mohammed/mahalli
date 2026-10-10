import 'package:isar_community/isar.dart';
import 'package:mahalli/core/database/collections/customer.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/database/collections/sale.dart';
import 'package:mahalli/core/database/transaction_runner.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/customers/domain/repository/customer_repository.dart';
import 'package:mahalli/features/returns/domain/models/return_line.dart';
import 'package:mahalli/features/returns/domain/models/return_result.dart';
import 'package:mahalli/features/returns/domain/models/returnable_item.dart';
import 'package:mahalli/features/stock/domain/repositories/stock_repository.dart';

import '../domain/repositories/returns_repository.dart';

class IsarReturnsRepository implements ReturnsRepository {
  IsarReturnsRepository(this.isar, this.transactions, this.stock, this.customers);
  final Isar isar;
  final TransactionRunner transactions;
  final StockRepository stock;
  final CustomerRepository customers;
  @override
  Future<List<ReturnableItem>> returnableItems(int saleId) async {
    final sold = await isar.saleItems.filter().saleIdEqualTo(saleId).findAll();
    final returns = await isar.saleReturns.filter().saleIdEqualTo(saleId).findAll();
    final returned = <int, int>{};
    for (final receipt in returns) {
      for (final row in await isar.returnItems.filter().returnIdEqualTo(receipt.id).findAll()) {
        returned.update(
          row.saleItemId,
          (v) => v + row.quantityMilli,
          ifAbsent: () => row.quantityMilli,
        );
      }
    }
    return sold
        .map(
          (row) => ReturnableItem(
            saleItemId: row.id,
            itemId: row.itemId,
            type: row.itemType,
            name: row.itemNameSnapshot,
            remainingMilli: row.quantityMilli - (returned[row.id] ?? 0),
            unitPrice: row.unitPrice,
            unitCost: row.unitCost,
          ),
        )
        .where((row) => row.remainingMilli > 0)
        .toList();
  }

  @override
  Future<ReturnResult> create(int saleId, List<ReturnLine> lines) async {
    if (lines.isEmpty ||
        lines.any(
          (line) => line.quantityMilli <= 0 || line.quantityMilli > line.item.remainingMilli,
        )) {
      throw const ValidationFailure('Invalid return quantity');
    }
    return transactions.run(() async {
      final sale = await isar.sales.get(saleId);
      if (sale == null) {
        throw const NotFoundFailure('Sale not found');
      }
      final total = lines.fold(
        0,
        (sum, line) => sum + ((line.item.unitPrice * line.quantityMilli + 500) ~/ 1000),
      );
      final debt = sale.customerId == null
          ? 0
          : await isar.debtTransactions
                .where()
                .customerIdEqualTo(sale.customerId!)
                .amountProperty()
                .sum();
      final debtReduction = total < debt ? total : debt;
      final refund = total - debtReduction;
      final receipt = SaleReturn()
        ..saleId = saleId
        ..customerId = sale.customerId
        ..totalAmount = total
        ..refundAmount = refund;
      receipt.id = await isar.saleReturns.put(receipt);
      for (final line in lines) {
        final amount = (line.item.unitPrice * line.quantityMilli + 500) ~/ 1000;
        await isar.returnItems.put(
          ReturnItem()
            ..returnId = receipt.id
            ..saleItemId = line.item.saleItemId
            ..quantityMilli = line.quantityMilli
            ..unitPrice = line.item.unitPrice
            ..unitCost = line.item.unitCost
            ..totalAmount = amount,
        );
        if (line.item.type == ItemType.product) {
          await stock.recordInTxn(
            productId: line.item.itemId,
            deltaMilli: line.quantityMilli,
            type: StockMovementType.returnIn,
            referenceId: receipt.id,
          );
        }
      }
      if (debtReduction > 0) {
        await customers.recordInTxn(
          customerId: sale.customerId!,
          type: DebtTxType.returnCredit,
          deltaMinor: -debtReduction,
          returnId: receipt.id,
        );
      }
      sale.paymentStatus = total >= sale.totalAmount
          ? PaymentStatus.refunded
          : PaymentStatus.partiallyRefunded;
      await isar.sales.put(sale);
      return ReturnResult(
        id: receipt.id,
        totalMinor: total,
        refundMinor: refund,
        debtReducedMinor: debtReduction,
      );
    });
  }
}
