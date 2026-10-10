import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/customers/domain/models/customer_input.dart';
import 'package:mahalli/features/customers/domain/usecases/save_customer.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_detail/customer_detail_state.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_form/customer_form_state.dart';

class CustomerFormCubit extends Cubit<CustomerFormState> {
  CustomerFormCubit(this.saveCustomer) : super(const CustomerFormState());
  final SaveCustomer saveCustomer;

  Future<CustomerActionResult> save(CustomerInput input, {int? id}) async {
    if (state.busy) return CustomerActionResult.failure;
    emit(const CustomerFormState(busy: true));
    try {
      await saveCustomer(input, id: id);
      emit(const CustomerFormState());
      return CustomerActionResult.success;
    } on ValidationFailure {
      emit(const CustomerFormState());
      return CustomerActionResult.invalid;
    } catch (_) {
      emit(const CustomerFormState());
      return CustomerActionResult.failure;
    }
  }
}
