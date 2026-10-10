import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';

import 'data/isar_report_repository.dart';
import 'domain/repository/report_repository.dart';

void registerReports(GetIt sl) =>
    sl.registerLazySingleton<ReportRepository>(() => IsarReportRepository(sl<Isar>()));
