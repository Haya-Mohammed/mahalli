import 'package:flutter_test/flutter_test.dart';
import 'package:mahalli/features/reports/domain/report_math.dart';

void main() {
  test('accrual profit subtracts return, cost and expense', () {
    final revenue = ReportMath.revenue(sales: 100000, returns: 10000);
    final gross = ReportMath.gross(revenue: revenue, cogs: 54000);
    expect(ReportMath.net(gross: gross, expenses: 15000), 21000);
  });
  test('period end is exclusive', () {
    final from = DateTime(2026, 10, 1);
    final to = DateTime(2026, 11, 1);
    expect(
      ReportMath.contains(DateTime(2026, 10, 31, 23, 59), from, to),
      isTrue,
    );
    expect(ReportMath.contains(to, from, to), isFalse);
  });
}
