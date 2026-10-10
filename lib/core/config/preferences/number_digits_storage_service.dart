import 'package:shared_preferences/shared_preferences.dart';

enum NumberDigits { western, arabicIndic }

abstract class NumberDigitsStorageService {
  NumberDigits getNumberDigits();
  Future<void> saveNumberDigits(NumberDigits digits);
}

class NumberDigitsStorageServiceImpl implements NumberDigitsStorageService {
  const NumberDigitsStorageServiceImpl(this._preferences);

  static const _key = 'number_digits';
  final SharedPreferences _preferences;

  @override
  NumberDigits getNumberDigits() {
    final value = _preferences.getString(_key);
    return NumberDigits.values.firstWhere(
      (digits) => digits.name == value,
      orElse: () => NumberDigits.western,
    );
  }

  @override
  Future<void> saveNumberDigits(NumberDigits digits) async {
    final saved = await _preferences.setString(_key, digits.name);
    if (!saved) throw StateError('Unable to save number digit preference.');
  }
}
