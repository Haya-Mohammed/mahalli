import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/error/failure.dart';

enum ListStatus { loading, loaded, error }

class ListState<T> extends Equatable {
  const ListState({
    this.status = ListStatus.loading,
    this.items = const [],
    this.includeInactive = false,
    this.failure,
  });
  final ListStatus status;
  final List<T> items;
  final bool includeInactive;
  final Failure? failure;

  ListState<T> copyWith({
    ListStatus? status,
    List<T>? items,
    bool? includeInactive,
    Failure? failure,
  }) => ListState(
    status: status ?? this.status,
    items: items ?? this.items,
    includeInactive: includeInactive ?? this.includeInactive,
    failure: failure,
  );

  @override
  List<Object?> get props => [status, items, includeInactive, failure];
}

/// Reactive list backed by a database watcher. UI updates automatically
/// whenever the underlying collection changes.
class WatchListCubit<T> extends Cubit<ListState<T>> {
  WatchListCubit(this._watch) : super(const ListState()) {
    _subscribe();
  }

  final Stream<List<T>> Function(bool includeInactive) _watch;
  StreamSubscription<List<T>>? _sub;

  void _subscribe() {
    _sub?.cancel();
    emit(state.copyWith(status: ListStatus.loading));
    _sub = _watch(state.includeInactive).listen(
      (items) => emit(state.copyWith(status: ListStatus.loaded, items: items)),
      onError: (Object e) => emit(
        state.copyWith(
          status: ListStatus.error,
          failure: e is Failure ? e : DatabaseFailure('$e'),
        ),
      ),
    );
  }

  void reload() => _subscribe();

  void setIncludeInactive(bool value) {
    emit(state.copyWith(includeInactive: value));
    _subscribe();
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
