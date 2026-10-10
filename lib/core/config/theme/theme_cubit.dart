import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/config/theme/theme_storage_service.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this._storage)
    : super(
        _storage.getThemePreference() == ThemePreference.dark
            ? ThemeMode.dark
            : ThemeMode.light,
      );

  final ThemeStorageService _storage;

  bool get isDarkMode => state == ThemeMode.dark;

  Future<void> toggleTheme() async {
    final next = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    await setTheme(next);
  }

  Future<void> setTheme(ThemeMode themeMode) async {
    if (state == themeMode) return;

    await _storage.saveThemePreference(
      themeMode == ThemeMode.dark
          ? ThemePreference.dark
          : ThemePreference.light,
    );
    emit(themeMode);
  }
}
