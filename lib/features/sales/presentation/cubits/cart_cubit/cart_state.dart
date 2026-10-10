import 'package:mahalli/features/sales/domain/models/cart_line.dart';
import 'package:mahalli/features/sales/domain/sales_rules.dart';

class CartState {
  final List<CartLine> lines;
  final int? customerId;
  final bool loadingDraft;

  const CartState({this.lines = const [], this.customerId, this.loadingDraft = false});

  int get total => cartTotal(lines);
}
