import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:mahalli/features/categories/presentation/cubit/category_cubit.dart';

import 'data/isar_category_repository.dart';
import 'domain/repository/category_repository.dart';

void registerCategories(GetIt sl) {
  sl.registerLazySingleton<CategoryRepository>(() => IsarCategoryRepository(sl<Isar>()));
  sl.registerFactory<CategoryCubit>(() => CategoryCubit(sl<CategoryRepository>()));
}
