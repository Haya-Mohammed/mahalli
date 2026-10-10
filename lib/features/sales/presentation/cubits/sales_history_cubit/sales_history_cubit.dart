import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/features/sales/domain/models/sales_page.dart';
import 'package:mahalli/features/sales/domain/repositories/sales_repository.dart';

class SalesHistoryCubit extends Cubit<SalesPage?> {
  final SalesRepository repository;
  SalesHistoryCubit(this.repository) : super(null);

  Future<void> load() async => emit(await repository.list(offset: 0, limit: 30));
}
