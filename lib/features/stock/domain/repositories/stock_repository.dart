import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/features/stock/domain/models/stock_movement_page.dart';
import 'package:mahalli/features/stock/domain/models/stock_product.dart';

abstract class StockRepository {
  Future<List<StockProduct>> listProducts();
  Future<StockProduct?> getProduct(int productId);
  Future<StockMovementPage> getMovements(int productId, {required int offset, required int limit});

  Future<StockProduct> addStock(int productId, int quantityMilli, {String? note});
  Future<StockProduct> adjustStock(int productId, int targetMilli, {String? note});
  Future<StockProduct> recordDamage(int productId, int quantityMilli, {required String reason});

  /// Caller owns the Isar write transaction. Used by future sale and return flows.
  Future<void> recordInTxn({
    required int productId,
    required int deltaMilli,
    required StockMovementType type,
    int? referenceId,
    String? note,
  });
}
