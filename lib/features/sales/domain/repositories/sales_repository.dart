import 'package:mahalli/features/sales/domain/models/cart_line.dart';
import 'package:mahalli/features/sales/domain/models/checkout_input.dart';
import 'package:mahalli/features/sales/domain/models/draft_cart_data.dart';
import 'package:mahalli/features/sales/domain/models/sale_details.dart';
import 'package:mahalli/features/sales/domain/models/sale_summary.dart';
import 'package:mahalli/features/sales/domain/models/sales_page.dart';

abstract class SalesRepository {
  Future<SaleSummary> create(CheckoutInput input);
  Future<void> saveDraft(List<CartLine> lines, {int? customerId});
  Future<DraftCartData?> loadDraft();
  Future<void> discardDraft();
  Future<SalesPage> list({required int offset, required int limit});
  Future<SaleDetails?> details(int saleId);
}
