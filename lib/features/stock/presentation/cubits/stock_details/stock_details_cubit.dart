import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/stock/domain/models/stock_product.dart';
import 'package:mahalli/features/stock/domain/repositories/stock_repository.dart';
import 'package:mahalli/features/stock/domain/usecases/stock_use_cases.dart';
import 'package:mahalli/features/stock/presentation/cubits/stock_details/stock_details_state.dart';

class StockDetailCubit extends Cubit<StockDetailState> {
  StockDetailCubit(this.repository, this.addStock, this.adjustStock, this.recordDamage)
    : super(const StockDetailState());
  static const pageSize = 30;
  final StockRepository repository;
  final AddStock addStock;
  final AdjustStock adjustStock;
  final RecordDamage recordDamage;

  Future<void> load(int productId) async {
    emit(
      StockDetailState(
        status: StockLoadStatus.loading,
        product: state.product,
        movements: state.movements,
      ),
    );
    try {
      final product = await repository.getProduct(productId);
      if (product == null) throw const NotFoundFailure('Product not found');
      final page = await repository.getMovements(productId, offset: 0, limit: pageSize);
      if (isClosed) return;
      emit(
        StockDetailState(
          status: StockLoadStatus.ready,
          product: product,
          movements: page.items,
          hasMore: page.hasMore,
        ),
      );
    } catch (_) {
      if (!isClosed) {
        emit(
          StockDetailState(
            status: StockLoadStatus.failure,
            product: state.product,
            movements: state.movements,
          ),
        );
      }
    }
  }

  Future<void> loadMore() async {
    if (!state.hasMore || state.loadingMore || state.product == null) return;
    final previous = state;
    emit(
      StockDetailState(
        status: previous.status,
        product: previous.product,
        movements: previous.movements,
        hasMore: previous.hasMore,
        loadingMore: true,
      ),
    );
    try {
      final page = await repository.getMovements(
        previous.product!.id,
        offset: previous.movements.length,
        limit: pageSize,
      );
      if (isClosed) return;
      emit(
        StockDetailState(
          status: StockLoadStatus.ready,
          product: previous.product,
          movements: [...previous.movements, ...page.items],
          hasMore: page.hasMore,
        ),
      );
    } catch (_) {
      if (!isClosed) emit(previous);
    }
  }

  Future<StockActionResult> add(int quantityMilli, {String? note}) =>
      _run(() => addStock(state.product!.id, quantityMilli, note: note));

  Future<StockActionResult> adjust(int targetMilli, {String? note}) =>
      _run(() => adjustStock(state.product!.id, targetMilli, note: note));

  Future<StockActionResult> damage(int quantityMilli, {required String reason}) =>
      _run(() => recordDamage(state.product!.id, quantityMilli, reason: reason));

  Future<StockActionResult> _run(Future<StockProduct> Function() action) async {
    if (state.busy || state.product == null) return StockActionResult.failure;
    final previous = state;
    emit(
      StockDetailState(
        status: previous.status,
        product: previous.product,
        movements: previous.movements,
        hasMore: previous.hasMore,
        busy: true,
      ),
    );
    try {
      await action();
      await load(previous.product!.id);
      return StockActionResult.success;
    } on InsufficientStockFailure {
      if (!isClosed) emit(previous);
      return StockActionResult.insufficient;
    } on ValidationFailure {
      if (!isClosed) emit(previous);
      return StockActionResult.invalid;
    } catch (_) {
      if (!isClosed) emit(previous);
      return StockActionResult.failure;
    }
  }
}
