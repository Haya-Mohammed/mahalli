import 'package:mahalli/features/stock/domain/models/stock_movement_entry.dart';

class StockMovementPage {
  const StockMovementPage(this.items, this.hasMore);
  final List<StockMovementEntry> items;
  final bool hasMore;
}
