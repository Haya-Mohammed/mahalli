import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeStorageService {
  ThemePreference getThemePreference();
  Future<void> saveThemePreference(ThemePreference preference);
}

enum ThemePreference { light, dark }

class ThemeStorageServiceImpl implements ThemeStorageService {
  static const _key = 'theme_preference';

  const ThemeStorageServiceImpl(this._preferences);

  final SharedPreferences _preferences;

  @override
  ThemePreference getThemePreference() {
    final savedPreference = _preferences.getString(_key);
    return ThemePreference.values.firstWhere(
      (preference) => preference.name == savedPreference,
      orElse: () => ThemePreference.light,
    );
  }

  @override
  Future<void> saveThemePreference(ThemePreference preference) async {
    final saved = await _preferences.setString(_key, preference.name);
    if (!saved) {
      throw StateError('Unable to save theme preference.');
    }
  }
}
