import 'package:mahalli/features/customers/domain/models/customer_details.dart';

enum CustomerLoadStatus { initial, loading, ready, failure }

enum CustomerSort { name, debt }

class CustomerListState {
  const CustomerListState({
    this.status = CustomerLoadStatus.initial,
    this.customers = const [],
    this.query = '',
    this.sort = CustomerSort.name,
    this.showInactive = false,
  });
  final CustomerLoadStatus status;
  final List<CustomerDetails> customers;
  final String query;
  final CustomerSort sort;
  final bool showInactive;

  List<CustomerDetails> get visible {
    final needle = query.trim().toLowerCase();
    final result = customers
        .where(
          (customer) =>
              (showInactive || customer.isActive) &&
              (needle.isEmpty ||
                  customer.name.toLowerCase().contains(needle) ||
                  (customer.phone?.contains(needle) ?? false)),
        )
        .toList();
    if (sort == CustomerSort.debt) {
      result.sort((a, b) => b.balanceMinor.compareTo(a.balanceMinor));
    } else {
      result.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    }
    return result;
  }
}
