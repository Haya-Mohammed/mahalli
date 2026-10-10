import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/stock/domain/models/stock_movement_page.dart';
import 'package:mahalli/features/stock/domain/models/stock_product.dart';

import '../repositories/stock_repository.dart';

class AddStock {
  const AddStock(this.repository);
  final StockRepository repository;

  Future<StockProduct> call(int productId, int quantityMilli, {String? note}) {
    if (quantityMilli <= 0) {
      throw const ValidationFailure('Stock addition must be positive');
    }
    return repository.addStock(productId, quantityMilli, note: note);
  }
}

class AdjustStock {
  const AdjustStock(this.repository);
  final StockRepository repository;

  Future<StockProduct> call(int productId, int targetMilli, {String? note}) {
    if (targetMilli < 0) {
      throw const ValidationFailure('Counted stock cannot be negative');
    }
    return repository.adjustStock(productId, targetMilli, note: note);
  }
}

class RecordDamage {
  const RecordDamage(this.repository);
  final StockRepository repository;

  Future<StockProduct> call(int productId, int quantityMilli, {required String reason}) {
    if (quantityMilli <= 0 || reason.trim().isEmpty) {
      throw const ValidationFailure('Damage quantity and reason required');
    }
    return repository.recordDamage(productId, quantityMilli, reason: reason.trim());
  }
}

class GetMovements {
  const GetMovements(this.repository);
  final StockRepository repository;

  Future<StockMovementPage> call(int productId, {required int offset, int limit = 30}) =>
      repository.getMovements(productId, offset: offset, limit: limit);
}
