import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:mahalli/features/catalog/presentation/cubit/catalog_cubit.dart';

import 'data/isar_catalog_repository.dart';
import 'domain/repository/catalog_repository.dart';

void registerCatalog(GetIt sl) {
  sl.registerLazySingleton<CatalogRepository>(() => IsarCatalogRepository(sl<Isar>()));
  sl.registerFactory<CatalogCubit>(() => CatalogCubit(sl<CatalogRepository>()));
  sl.registerFactory<CatalogFormCubit>(() => CatalogFormCubit(sl<CatalogRepository>()));
}
