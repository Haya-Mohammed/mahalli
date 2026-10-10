import 'package:mahalli/features/customers/domain/models/customer_details.dart';

class DebtSummary {
  const DebtSummary({required this.totalMinor, required this.largestBalances});
  final int totalMinor;
  final List<CustomerDetails> largestBalances;
}
