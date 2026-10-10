import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/error/failure.dart';
import 'package:mahalli/features/catalog/domain/models/catalog_item.dart';
import 'package:mahalli/features/catalog/domain/models/product_input.dart';
import 'package:mahalli/features/catalog/domain/models/service_input.dart';
import 'package:mahalli/features/catalog/presentation/cubit/catalog_state.dart';

import '../../domain/repository/catalog_repository.dart';

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit(this.repository) : super(const CatalogState());
  static const pageSize = 30;
  final CatalogRepository repository;
  Timer? _debounce;
  int _request = 0;

  Future<void> load() async {
    final ticket = ++_request;
    emit(
      CatalogState(
        status: CatalogStatus.loading,
        type: state.type,
        query: state.query,
        includeInactive: state.includeInactive,
        items: state.items,
      ),
    );
    try {
      final result = await repository.search(
        type: state.type,
        query: state.query,
        includeInactive: state.includeInactive,
        offset: 0,
        limit: pageSize,
      );
      if (isClosed || ticket != _request) return;
      emit(
        CatalogState(
          status: CatalogStatus.ready,
          type: state.type,
          query: state.query,
          includeInactive: state.includeInactive,
          items: result.items,
          hasMore: result.hasMore,
        ),
      );
    } catch (_) {
      if (isClosed || ticket != _request) return;
      emit(
        CatalogState(
          status: CatalogStatus.failure,
          type: state.type,
          query: state.query,
          includeInactive: state.includeInactive,
          items: state.items,
        ),
      );
    }
  }

  void selectType(ItemType type) {
    if (state.type == type) return;
    _debounce?.cancel();
    emit(CatalogState(type: type, query: state.query, includeInactive: state.includeInactive));
    load();
  }

  void search(String query) {
    _debounce?.cancel();
    ++_request;
    emit(
      CatalogState(
        status: state.status,
        type: state.type,
        query: query,
        includeInactive: state.includeInactive,
        items: state.items,
      ),
    );
    _debounce = Timer(const Duration(milliseconds: 150), load);
  }

  void showInactive(bool value) {
    emit(CatalogState(type: state.type, query: state.query, includeInactive: value));
    load();
  }

  Future<void> loadMore() async {
    if (!state.hasMore || state.loadingMore || state.status != CatalogStatus.ready) {
      return;
    }
    final ticket = _request;
    final previous = state;
    emit(
      CatalogState(
        status: previous.status,
        type: previous.type,
        query: previous.query,
        includeInactive: previous.includeInactive,
        items: previous.items,
        hasMore: previous.hasMore,
        loadingMore: true,
      ),
    );
    try {
      final result = await repository.search(
        type: previous.type,
        query: previous.query,
        includeInactive: previous.includeInactive,
        offset: previous.items.length,
        limit: pageSize,
      );
      if (isClosed || ticket != _request) return;
      emit(
        CatalogState(
          status: CatalogStatus.ready,
          type: previous.type,
          query: previous.query,
          includeInactive: previous.includeInactive,
          items: [...previous.items, ...result.items],
          hasMore: result.hasMore,
        ),
      );
    } catch (_) {
      if (!isClosed && ticket == _request) emit(previous);
    }
  }

  Future<CatalogItem?> lookupBarcode(String barcode) => repository.getByBarcode(barcode);

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}

enum CatalogSaveStatus { saved, duplicateBarcode, invalid, failure }

class CatalogFormState {
  const CatalogFormState({this.busy = false, this.status});
  final bool busy;
  final CatalogSaveStatus? status;
}

class CatalogFormCubit extends Cubit<CatalogFormState> {
  CatalogFormCubit(this.repository) : super(const CatalogFormState());
  final CatalogRepository repository;

  Future<CatalogSaveStatus> saveProduct(ProductInput input, {int? id}) async {
    if (state.busy) return CatalogSaveStatus.failure;
    emit(const CatalogFormState(busy: true));
    try {
      await repository.saveProduct(input, id: id);
      emit(const CatalogFormState(status: CatalogSaveStatus.saved));
      return CatalogSaveStatus.saved;
    } on DuplicateBarcodeFailure {
      emit(const CatalogFormState(status: CatalogSaveStatus.duplicateBarcode));
      return CatalogSaveStatus.duplicateBarcode;
    } on ValidationFailure {
      emit(const CatalogFormState(status: CatalogSaveStatus.invalid));
      return CatalogSaveStatus.invalid;
    } catch (_) {
      emit(const CatalogFormState(status: CatalogSaveStatus.failure));
      return CatalogSaveStatus.failure;
    }
  }

  Future<CatalogSaveStatus> saveService(ServiceInput input, {int? id}) async {
    if (state.busy) return CatalogSaveStatus.failure;
    emit(const CatalogFormState(busy: true));
    try {
      await repository.saveService(input, id: id);
      emit(const CatalogFormState(status: CatalogSaveStatus.saved));
      return CatalogSaveStatus.saved;
    } on ValidationFailure {
      emit(const CatalogFormState(status: CatalogSaveStatus.invalid));
      return CatalogSaveStatus.invalid;
    } catch (_) {
      emit(const CatalogFormState(status: CatalogSaveStatus.failure));
      return CatalogSaveStatus.failure;
    }
  }
}
