import 'package:mahalli/features/customers/domain/models/customer_details.dart';
import 'package:mahalli/features/customers/domain/models/debt_entry.dart';
import 'package:mahalli/features/customers/presentation/cubits/customer_list/customer_list_state.dart';

enum CustomerActionResult { success, invalid, overpayment, outstanding, failure }

class CustomerDetailState {
  const CustomerDetailState({
    this.status = CustomerLoadStatus.initial,
    this.customer,
    this.entries = const [],
    this.hasMore = false,
    this.loadingMore = false,
    this.busy = false,
  });
  final CustomerLoadStatus status;
  final CustomerDetails? customer;
  final List<DebtEntry> entries;
  final bool hasMore;
  final bool loadingMore;
  final bool busy;
}
