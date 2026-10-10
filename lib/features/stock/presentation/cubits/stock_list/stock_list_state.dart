import 'package:mahalli/features/stock/domain/models/stock_enums.dart';
import 'package:mahalli/features/stock/domain/models/stock_product.dart';
import 'package:mahalli/features/stock/presentation/cubits/stock_details/stock_details_state.dart';

class StockListState {
  const StockListState({
    this.status = StockLoadStatus.initial,
    this.products = const [],
    this.filter = StockFilter.all,
    this.query = '',
  });
  final StockLoadStatus status;
  final List<StockProduct> products;
  final StockFilter filter;
  final String query;

  List<StockProduct> get visibleProducts {
    final needle = query.trim().toLowerCase();
    return products
        .where(
          (product) =>
              product.isActive &&
              matchesStockFilter(product, filter) &&
              (needle.isEmpty ||
                  product.name.toLowerCase().contains(needle) ||
                  (product.barcode?.toLowerCase().contains(needle) ?? false) ||
                  (product.sku?.toLowerCase().contains(needle) ?? false)),
        )
        .toList();
  }
}
