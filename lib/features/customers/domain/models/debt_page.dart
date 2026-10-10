import 'package:mahalli/features/customers/domain/models/debt_entry.dart';

class DebtPage {
  const DebtPage(this.entries, this.hasMore);
  final List<DebtEntry> entries;
  final bool hasMore;
}
