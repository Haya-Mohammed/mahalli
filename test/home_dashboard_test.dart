import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mahalli/features/home/domain/dashboard_repository.dart';
import 'package:mahalli/features/home/domain/dashboard_summary.dart';
import 'package:mahalli/features/home/domain/get_dashboard_summary.dart';
import 'package:mahalli/features/home/presentation/home_cubit.dart';

class FakeDashboardRepository implements DashboardRepository {
  DateTime? start;
  DateTime? end;
  Future<DashboardSummary> Function()? onLoad;

  @override
  Future<DashboardSummary> loadForDay(DateTime startLocal, DateTime endLocal) {
    start = startLocal;
    end = endLocal;
    return onLoad?.call() ?? Future.value(DashboardSummary.empty);
  }
}

void main() {
  test('dashboard requests the full local calendar day', () async {
    final repository = FakeDashboardRepository();
    await GetDashboardSummary(
      repository,
      now: () => DateTime(2026, 12, 31, 23, 59),
    )();

    expect(repository.start, DateTime(2026, 12, 31));
    expect(repository.end, DateTime(2027, 1, 1));
  });

  test('refresh retains the previous summary if loading fails', () async {
    final repository = FakeDashboardRepository();
    final cubit = HomeCubit(GetDashboardSummary(repository));
    addTearDown(cubit.close);

    await cubit.load();
    expect(cubit.state.status, HomeStatus.loaded);

    final pending = Completer<DashboardSummary>();
    repository.onLoad = () => pending.future;
    final refresh = cubit.load(refresh: true);
    expect(cubit.state.refreshing, isTrue);
    expect(cubit.state.summary, DashboardSummary.empty);

    pending.completeError(StateError('database unavailable'));
    await refresh;
    expect(cubit.state.status, HomeStatus.error);
    expect(cubit.state.summary, DashboardSummary.empty);
    expect(cubit.state.refreshing, isFalse);
  });
}
