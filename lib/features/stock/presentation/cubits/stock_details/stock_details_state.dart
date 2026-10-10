import 'package:mahalli/features/stock/domain/models/stock_movement_entry.dart';
import 'package:mahalli/features/stock/domain/models/stock_product.dart';

enum StockLoadStatus { initial, loading, ready, failure }

enum StockActionResult { success, invalid, insufficient, failure }

class StockDetailState {
  const StockDetailState({
    this.status = StockLoadStatus.initial,
    this.product,
    this.movements = const [],
    this.hasMore = false,
    this.loadingMore = false,
    this.busy = false,
  });
  final StockLoadStatus status;
  final StockProduct? product;
  final List<StockMovementEntry> movements;
  final bool hasMore;
  final bool loadingMore;
  final bool busy;
}
