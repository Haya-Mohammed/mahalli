import 'package:flutter_bloc/flutter_bloc.dart';

import 'number_digits_storage_service.dart';

class NumberDigitsCubit extends Cubit<NumberDigits> {
  NumberDigitsCubit(this._storage) : super(_storage.getNumberDigits());

  final NumberDigitsStorageService _storage;

  Future<void> setDigits(NumberDigits digits) async {
    if (digits == state) return;
    await _storage.saveNumberDigits(digits);
    emit(digits);
  }
}
