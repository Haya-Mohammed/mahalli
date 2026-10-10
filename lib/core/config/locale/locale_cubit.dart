import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/config/locale/locale_state.dart';
import 'package:mahalli/core/config/locale/locale_storage_service.dart';

class LocaleCubit extends Cubit<LocaleState> {
  static const supportedLocales = [Locale('ar'), Locale('en')];
  static const defaultLocale = Locale('ar');

  final LocaleStorageService storageService;

  LocaleCubit(this.storageService)
    : super(LocaleState(_restoreLocale(storageService)));

  static Locale _restoreLocale(LocaleStorageService storage) {
    final savedCode = storage.getLocaleCode();
    return supportedLocales.firstWhere(
      (locale) => locale.languageCode == savedCode,
      orElse: () => defaultLocale,
    );
  }

  Future<void> changeLocale(Locale locale) async {
    if (locale.languageCode == state.locale.languageCode) return;
    await storageService.saveLocaleCode(locale.languageCode);
    emit(LocaleState(locale));
  }

  Future<void> toggleLocale() async {
    final next = state.isArabic ? const Locale('en') : const Locale('ar');
    await changeLocale(next);
  }
}
