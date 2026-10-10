import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';

import 'data/backup_service.dart';

void registerBackup(GetIt sl) =>
    sl.registerLazySingleton<BackupService>(() => BackupService(sl<Isar>()));
