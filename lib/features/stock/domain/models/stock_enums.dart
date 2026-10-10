import 'package:mahalli/features/stock/domain/models/stock_product.dart';

enum StockFilter { all, low, out, negative }

enum StockStatus { healthy, low, out, negative }

StockStatus stockStatus(int quantityMilli, int thresholdMilli) {
  if (quantityMilli < 0) return StockStatus.negative;
  if (quantityMilli == 0) return StockStatus.out;
  if (quantityMilli <= thresholdMilli) return StockStatus.low;
  return StockStatus.healthy;
}

bool matchesStockFilter(StockProduct product, StockFilter filter) => switch (filter) {
  StockFilter.all => true,
  StockFilter.low => product.status == StockStatus.low,
  StockFilter.out => product.status == StockStatus.out,
  StockFilter.negative => product.status == StockStatus.negative,
};
