import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/categories/domain/models/category_Model.dart';

import '../../domain/repository/category_repository.dart';

enum CategoryStatus { initial, loading, ready, failure }

enum CategorySaveResult { saved, duplicate, invalid, failure }

class CategoryState {
  const CategoryState({
    this.status = CategoryStatus.initial,
    this.items = const [],
    this.busy = false,
  });
  final CategoryStatus status;
  final List<CategoryModel> items;
  final bool busy;
}

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.repository) : super(const CategoryState());
  final CategoryRepository repository;

  Future<void> load() async {
    emit(CategoryState(status: CategoryStatus.loading, items: state.items));
    try {
      final items = await repository.list();
      if (!isClosed) {
        emit(CategoryState(status: CategoryStatus.ready, items: items));
      }
    } catch (_) {
      if (!isClosed) {
        emit(CategoryState(status: CategoryStatus.failure, items: state.items));
      }
    }
  }

  Future<CategorySaveResult> save({int? id, required String name, required ItemType type}) async {
    if (state.busy) return CategorySaveResult.failure;
    emit(CategoryState(status: state.status, items: state.items, busy: true));
    try {
      await repository.save(id: id, name: name, type: type);
      await load();
      return CategorySaveResult.saved;
    } on DuplicateNameFailure {
      _idle();
      return CategorySaveResult.duplicate;
    } on ValidationFailure {
      _idle();
      return CategorySaveResult.invalid;
    } catch (_) {
      _idle();
      return CategorySaveResult.failure;
    }
  }

  Future<bool> setActive(int id, bool active) async {
    if (state.busy) return false;
    emit(CategoryState(status: state.status, items: state.items, busy: true));
    try {
      await repository.setActive(id, active);
      await load();
      return true;
    } catch (_) {
      _idle();
      return false;
    }
  }

  void _idle() {
    if (!isClosed) {
      emit(CategoryState(status: state.status, items: state.items));
    }
  }
}
