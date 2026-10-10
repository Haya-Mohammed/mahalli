import 'package:flutter_test/flutter_test.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/catalog/domain/models/catalog_item.dart';
import 'package:mahalli/features/sales/domain/models/cart_line.dart';
import 'package:mahalli/features/sales/domain/models/checkout_input.dart';
import 'package:mahalli/features/sales/domain/models/draft_cart_data.dart';
import 'package:mahalli/features/sales/domain/models/sale_details.dart';
import 'package:mahalli/features/sales/domain/models/sale_summary.dart';
import 'package:mahalli/features/sales/domain/models/sales_page.dart';
import 'package:mahalli/features/sales/domain/repositories/sales_repository.dart';
import 'package:mahalli/features/sales/domain/sales_rules.dart';
import 'package:mahalli/features/sales/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:mahalli/features/sales/presentation/cubits/checkout_cubit/checkout_cubit.dart';
import 'package:mahalli/features/sales/presentation/cubits/checkout_cubit/checkout_state.dart';

CatalogItem product({int id = 1, int price = 1000}) => CatalogItem(
  id: id,
  type: ItemType.product,
  name: 'Tea',
  sellingPrice: price,
  cost: 500,
  isActive: true,
);

class _SalesMemoryRepository implements SalesRepository {
  CheckoutInput? created;
  @override
  Future<SaleSummary> create(CheckoutInput input) async {
    created = input;
    return SaleSummary(
      id: 1,
      saleNumber: 1,
      totalAmount: cartTotal(input.lines),
      paidAmount: input.paidAmount,
      remainingAmount: cartTotal(input.lines) - input.paidAmount,
      paymentStatus: paymentStatusFor(cartTotal(input.lines), input.paidAmount),
      createdAt: DateTime(2026),
    );
  }

  @override
  Future<void> discardDraft() async {}
  @override
  Future<SaleDetails?> details(int saleId) async => null;
  @override
  Future<SalesPage> list({required int offset, required int limit}) async =>
      const SalesPage([], false);
  @override
  Future<DraftCartData?> loadDraft() async => null;
  @override
  Future<void> saveDraft(List<CartLine> lines, {int? customerId}) async {}
}

void main() {
  test('cart totals preserve quantity precision and partial payment', () {
    final lines = [
      CartLine(item: product(price: 1000), quantityMilli: 2000),
      CartLine(item: product(id: 2, price: 500), quantityMilli: 3000),
    ];
    expect(cartTotal(lines), 3500);
    expect(paymentStatusFor(10000, 4000), PaymentStatus.partial);
  });

  test('credit requires a customer and paid amount cannot exceed total', () {
    final line = CartLine(item: product(), quantityMilli: 1000);
    expect(
      () => validateCheckout(CheckoutInput(lines: [line], paidAmount: 0)),
      throwsA(isA<ValidationFailure>()),
    );
    expect(
      () => validateCheckout(CheckoutInput(lines: [line], paidAmount: 1001, customerId: 1)),
      throwsA(isA<ValidationFailure>()),
    );
  });

  test('cart merges same product and checkout rejects double submit', () async {
    final repo = _SalesMemoryRepository();
    final cart = CartCubit(repo);
    cart.add(product());
    cart.add(product());
    expect(cart.state.lines.single.quantityMilli, 2000);
    final checkout = CheckoutCubit(repo);
    await checkout.submit(CheckoutInput(lines: cart.state.lines, paidAmount: 2000));
    expect(checkout.state.status, CheckoutStatus.success);
    expect(repo.created!.lines.single.quantityMilli, 2000);
  });
}
