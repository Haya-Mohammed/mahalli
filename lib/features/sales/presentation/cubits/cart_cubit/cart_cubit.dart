import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/features/catalog/domain/models/catalog_item.dart';
import 'package:mahalli/features/sales/domain/models/cart_line.dart';
import 'package:mahalli/features/sales/domain/models/draft_cart_data.dart';
import 'package:mahalli/features/sales/domain/repositories/sales_repository.dart';
import 'package:mahalli/features/sales/presentation/cubits/cart_cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.repository) : super(const CartState());
  final SalesRepository repository;

  void add(CatalogItem item) {
    final index = state.lines.indexWhere(
      (line) => line.item.type == item.type && line.item.id == item.id,
    );
    final lines = [...state.lines];
    if (index < 0) {
      lines.add(CartLine(item: item, quantityMilli: 1000));
    } else {
      lines[index] = lines[index].copyWith(quantityMilli: lines[index].quantityMilli + 1000);
    }
    emit(CartState(lines: lines, customerId: state.customerId));
  }

  void update(CartLine line, int quantityMilli) {
    final lines = [...state.lines];
    final index = lines.indexOf(line);
    if (index < 0) return;
    if (quantityMilli <= 0) {
      lines.removeAt(index);
    } else {
      lines[index] = line.copyWith(quantityMilli: quantityMilli);
    }
    emit(CartState(lines: lines, customerId: state.customerId));
  }

  void setCustomer(int? id) => emit(CartState(lines: state.lines, customerId: id));
  void clear() => emit(const CartState());
  Future<void> saveDraft() => repository.saveDraft(state.lines, customerId: state.customerId);
  Future<DraftCartData?> loadDraft() => repository.loadDraft();
  void restore(DraftCartData draft) =>
      emit(CartState(lines: draft.lines, customerId: draft.customerId));
  Future<void> discardDraft() => repository.discardDraft();
}
