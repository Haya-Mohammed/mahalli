import 'dart:ui';

import 'package:equatable/equatable.dart';

class LocaleState extends Equatable {
  final Locale locale;

  const LocaleState(this.locale);

  bool get isArabic => locale.languageCode == 'ar';

  @override
  List<Object?> get props => [locale];
}
