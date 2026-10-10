import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/features/customers/domain/repository/customer_repository.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_list/customer_list_state.dart';

class CustomerListCubit extends Cubit<CustomerListState> {
  CustomerListCubit(this.repository) : super(const CustomerListState());
  final CustomerRepository repository;

  Future<void> load() async {
    emit(
      CustomerListState(
        status: CustomerLoadStatus.loading,
        customers: state.customers,
        query: state.query,
        sort: state.sort,
        showInactive: state.showInactive,
      ),
    );
    try {
      final customers = await repository.list();
      if (isClosed) return;
      emit(
        CustomerListState(
          status: CustomerLoadStatus.ready,
          customers: customers,
          query: state.query,
          sort: state.sort,
          showInactive: state.showInactive,
        ),
      );
    } catch (_) {
      if (isClosed) return;
      emit(
        CustomerListState(
          status: CustomerLoadStatus.failure,
          customers: state.customers,
          query: state.query,
          sort: state.sort,
          showInactive: state.showInactive,
        ),
      );
    }
  }

  void search(String query) => emit(
    CustomerListState(
      status: state.status,
      customers: state.customers,
      query: query,
      sort: state.sort,
      showInactive: state.showInactive,
    ),
  );

  void sortBy(CustomerSort sort) => emit(
    CustomerListState(
      status: state.status,
      customers: state.customers,
      query: state.query,
      sort: sort,
      showInactive: state.showInactive,
    ),
  );

  void showInactive(bool value) => emit(
    CustomerListState(
      status: state.status,
      customers: state.customers,
      query: state.query,
      sort: state.sort,
      showInactive: value,
    ),
  );
}
