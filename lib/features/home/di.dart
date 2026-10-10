import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:mahalli/features/home/presentation/home_cubit.dart';
import 'data/isar_dashboard_repository.dart';
import 'domain/dashboard_repository.dart';
import 'domain/get_dashboard_summary.dart';

void registerHome(GetIt sl) {
  sl.registerLazySingleton<DashboardRepository>(
    () => IsarDashboardRepository(sl<Isar>()),
  );
  sl.registerLazySingleton<GetDashboardSummary>(
    () => GetDashboardSummary(sl<DashboardRepository>()),
  );
  sl.registerFactory<HomeCubit>(() => HomeCubit(sl<GetDashboardSummary>()));
}
