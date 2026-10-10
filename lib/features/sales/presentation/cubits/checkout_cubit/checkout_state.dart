import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/sales/domain/models/sale_summary.dart';

enum CheckoutStatus { idle, submitting, success, failure, invalid }

class CheckoutState {
  final CheckoutStatus status;
  final SaleSummary? sale;
  final Failure? failure;

  const CheckoutState({this.status = CheckoutStatus.idle, this.sale, this.failure});
}
