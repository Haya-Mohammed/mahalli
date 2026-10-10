import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/customers/domain/models/customer_details.dart';
import 'package:mahalli/features/customers/domain/repository/customer_repository.dart';
import 'package:mahalli/features/customers/domain/usecases/record_adjustment.dart';
import 'package:mahalli/features/customers/domain/usecases/record_payment.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_detail/customer_detail_state.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_list/customer_list_state.dart';

class CustomerDetailCubit extends Cubit<CustomerDetailState> {
  CustomerDetailCubit(this.repository, this.recordPayment, this.recordAdjustment)
    : super(const CustomerDetailState());
  static const pageSize = 30;
  final CustomerRepository repository;
  final RecordPayment recordPayment;
  final RecordAdjustment recordAdjustment;

  Future<void> load(int id) async {
    emit(
      CustomerDetailState(
        status: CustomerLoadStatus.loading,
        customer: state.customer,
        entries: state.entries,
      ),
    );
    try {
      final customer = await repository.get(id);
      if (customer == null) throw const NotFoundFailure('Customer not found');
      final page = await repository.ledger(id, offset: 0, limit: pageSize);
      if (isClosed) return;
      emit(
        CustomerDetailState(
          status: CustomerLoadStatus.ready,
          customer: customer,
          entries: page.entries,
          hasMore: page.hasMore,
        ),
      );
    } catch (_) {
      if (!isClosed) {
        emit(
          CustomerDetailState(
            status: CustomerLoadStatus.failure,
            customer: state.customer,
            entries: state.entries,
          ),
        );
      }
    }
  }

  Future<void> loadMore() async {
    if (!state.hasMore || state.loadingMore || state.customer == null) return;
    final previous = state;
    emit(
      CustomerDetailState(
        status: previous.status,
        customer: previous.customer,
        entries: previous.entries,
        hasMore: previous.hasMore,
        loadingMore: true,
      ),
    );
    try {
      final page = await repository.ledger(
        previous.customer!.id,
        offset: previous.entries.length,
        limit: pageSize,
      );
      if (isClosed) return;
      emit(
        CustomerDetailState(
          status: CustomerLoadStatus.ready,
          customer: previous.customer,
          entries: [...previous.entries, ...page.entries],
          hasMore: page.hasMore,
        ),
      );
    } catch (_) {
      if (!isClosed) emit(previous);
    }
  }

  Future<CustomerActionResult> payment(int amountMinor, {String? note}) =>
      _run(() => recordPayment(state.customer!.id, amountMinor, note: note));

  Future<CustomerActionResult> adjustment(int deltaMinor, {required String reason}) =>
      _run(() => recordAdjustment(state.customer!.id, deltaMinor, reason: reason));

  Future<CustomerActionResult> setActive(bool active, {bool allowOutstandingDebt = false}) =>
      _run(() async {
        await repository.setActive(
          state.customer!.id,
          active,
          allowOutstandingDebt: allowOutstandingDebt,
        );
        return (await repository.get(state.customer!.id))!;
      });

  Future<CustomerActionResult> _run(Future<CustomerDetails> Function() action) async {
    if (state.busy || state.customer == null) {
      return CustomerActionResult.failure;
    }
    final previous = state;
    emit(
      CustomerDetailState(
        status: previous.status,
        customer: previous.customer,
        entries: previous.entries,
        hasMore: previous.hasMore,
        busy: true,
      ),
    );
    try {
      await action();
      await load(previous.customer!.id);
      return CustomerActionResult.success;
    } on OverpaymentFailure {
      if (!isClosed) emit(previous);
      return CustomerActionResult.overpayment;
    } on OutstandingDebtFailure {
      if (!isClosed) emit(previous);
      return CustomerActionResult.outstanding;
    } on ValidationFailure {
      if (!isClosed) emit(previous);
      return CustomerActionResult.invalid;
    } catch (_) {
      if (!isClosed) emit(previous);
      return CustomerActionResult.failure;
    }
  }
}
