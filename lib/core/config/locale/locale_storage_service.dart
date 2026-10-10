import 'package:shared_preferences/shared_preferences.dart';

abstract class LocaleStorageService {
  Future<void> saveLocaleCode(String localeCode);
  String? getLocaleCode();
}

class LocaleStorageServiceImpl implements LocaleStorageService {
  static const _key = 'locale_code';

  final SharedPreferences preferences;

  LocaleStorageServiceImpl(this.preferences);

  @override
  String? getLocaleCode() => preferences.getString(_key);

  @override
  Future<void> saveLocaleCode(String localeCode) =>
      preferences.setString(_key, localeCode);
}
