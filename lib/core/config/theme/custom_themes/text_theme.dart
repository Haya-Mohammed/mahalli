import 'package:flutter/material.dart';
import 'package:mahalli/core/config/theme/colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static const String fontFamily = 'Cairo';
  static const List<String> fontFallback = ['IBM Plex Sans Arabic'];

  static TextStyle base(
    double size,
    FontWeight weight, {
    Color color = AppColors.textPrimary,
    double height = 1.3,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontFamilyFallback: fontFallback,
      fontSize: size,
      fontWeight: weight,
      height: height,
      color: color,
    );
  }

  static TextTheme _build({required bool dark}) {
    final primary = dark ? AppDarkColors.textPrimary : AppColors.textPrimary;
    final secondary = dark
        ? AppDarkColors.textSecondary
        : AppColors.textSecondary;

    return TextTheme(
      // h1
      displayLarge: base(28, FontWeight.w800, color: primary, height: 1.35),

      // h2
      headlineLarge: base(26, FontWeight.w700, color: primary, height: 1.38),

      // h3
      headlineMedium: base(22, FontWeight.w700, color: primary, height: 1.45),

      // body
      bodyLarge: base(18, FontWeight.w500, color: primary, height: 1.55),

      // bodySmall
      bodyMedium: base(16, FontWeight.w500, color: secondary, height: 1.6),

      // bodySmallMedium
      titleSmall: base(17, FontWeight.w700, color: primary, height: 1.4),

      labelLarge: base(16, FontWeight.w600, color: primary, height: 1.3),
      labelMedium: base(14, FontWeight.w500, color: primary, height: 1.3),

      // caption
      labelSmall: base(12, FontWeight.w500, color: secondary, height: 1.5),

      bodySmall: base(12, FontWeight.w500, color: secondary, height: 1.5),
    );
  }

  static final lightTextTheme = _build(dark: false);
  static final darkTextTheme = _build(dark: true);
}
