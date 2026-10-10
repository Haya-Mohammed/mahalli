import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/dashboard_summary.dart';
import '../domain/get_dashboard_summary.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomeState {
  const HomeState({
    this.status = HomeStatus.initial,
    this.summary,
    this.refreshing = false,
  });
  final HomeStatus status;
  final DashboardSummary? summary;
  final bool refreshing;
}

/// ViewModel for the Home view. `Cubit` remains in the public type name while
/// feature callers complete their migration to `HomeViewModel`.
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.getSummary) : super(const HomeState());
  final GetDashboardSummary getSummary;
  bool _loading = false;

  Future<void> load({bool refresh = false}) async {
    if (_loading) return;
    _loading = true;
    final previous = state.summary;
    emit(
      HomeState(
        status: previous == null ? HomeStatus.loading : HomeStatus.loaded,
        summary: previous,
        refreshing: previous != null && refresh,
      ),
    );
    try {
      final summary = await getSummary();
      if (!isClosed) {
        emit(HomeState(status: HomeStatus.loaded, summary: summary));
      }
    } catch (_) {
      if (!isClosed) {
        emit(HomeState(status: HomeStatus.error, summary: previous));
      }
    } finally {
      _loading = false;
    }
  }
}
