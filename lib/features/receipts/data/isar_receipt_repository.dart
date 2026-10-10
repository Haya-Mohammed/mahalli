import 'package:isar_community/isar.dart';
import 'package:mahalli/core/database/collections/customer.dart';
import 'package:mahalli/core/database/collections/sale.dart';
import 'package:mahalli/core/database/collections/shop.dart';
import 'package:mahalli/features/receipts/domain/models/receipt.dart';
import 'package:mahalli/features/receipts/domain/models/receipt_line.dart';

import '../domain/repository/receipt_repository.dart';

class IsarReceiptRepository implements ReceiptRepository {
  const IsarReceiptRepository(this.isar);
  final Isar isar;
  @override
  Future<Receipt?> build(int saleId) async {
    final sale = await isar.sales.get(saleId);
    if (sale == null) return null;
    final shop = await isar.shops.where().findFirst();
    final customer = sale.customerId == null ? null : await isar.customers.get(sale.customerId!);
    final items = await isar.saleItems.filter().saleIdEqualTo(saleId).findAll();
    return Receipt(
      shopName: shop?.name ?? '',
      number: sale.id,
      createdAt: sale.createdAt,
      lines: items
          .map(
            (i) => ReceiptLine(
              name: i.itemNameSnapshot,
              quantityMilli: i.quantityMilli,
              unitPriceMinor: i.unitPrice,
              totalMinor: i.totalPrice,
            ),
          )
          .toList(),
      totalMinor: sale.totalAmount,
      paidMinor: sale.paidAmount,
      remainingMinor: sale.remainingAmount,
      customerName: customer?.name,
    );
  }
}
