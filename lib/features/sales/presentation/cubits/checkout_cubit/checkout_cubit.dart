import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/sales/domain/models/checkout_input.dart';
import 'package:mahalli/features/sales/domain/repositories/sales_repository.dart';
import 'package:mahalli/features/sales/domain/sales_rules.dart';
import 'package:mahalli/features/sales/presentation/cubits/checkout_cubit/checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final SalesRepository repository;

  CheckoutCubit(this.repository) : super(const CheckoutState());

  Future<void> submit(CheckoutInput input) async {
    if (state.status == CheckoutStatus.submitting) return;
    try {
      validateCheckout(input);
    } on Failure catch (e) {
      emit(CheckoutState(status: CheckoutStatus.invalid, failure: e));
      return;
    }
    emit(const CheckoutState(status: CheckoutStatus.submitting));
    try {
      emit(CheckoutState(status: CheckoutStatus.success, sale: await repository.create(input)));
    } on Failure catch (e) {
      emit(CheckoutState(status: CheckoutStatus.failure, failure: e));
    } catch (_) {
      emit(const CheckoutState(status: CheckoutStatus.failure));
    }
  }
}
