import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/features/stock/domain/models/stock_enums.dart';
import 'package:mahalli/features/stock/domain/repositories/stock_repository.dart';
import 'package:mahalli/features/stock/presentation/cubits/stock_details/stock_details_state.dart';
import 'package:mahalli/features/stock/presentation/cubits/stock_list/stock_list_state.dart';

class StockListCubit extends Cubit<StockListState> {
  StockListCubit(this.repository) : super(const StockListState());
  final StockRepository repository;

  Future<void> load() async {
    emit(
      StockListState(
        status: StockLoadStatus.loading,
        products: state.products,
        filter: state.filter,
        query: state.query,
      ),
    );
    try {
      final products = await repository.listProducts();
      if (isClosed) return;
      emit(
        StockListState(
          status: StockLoadStatus.ready,
          products: products,
          filter: state.filter,
          query: state.query,
        ),
      );
    } catch (_) {
      if (isClosed) return;
      emit(
        StockListState(
          status: StockLoadStatus.failure,
          products: state.products,
          filter: state.filter,
          query: state.query,
        ),
      );
    }
  }

  void filter(StockFilter value) => emit(
    StockListState(
      status: state.status,
      products: state.products,
      filter: value,
      query: state.query,
    ),
  );

  void search(String value) => emit(
    StockListState(
      status: state.status,
      products: state.products,
      filter: state.filter,
      query: value,
    ),
  );
}
