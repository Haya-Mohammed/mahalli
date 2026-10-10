import 'package:flutter/material.dart';

class _Teal {
  static const c100 = Color(0xFF9FE1CB);
  static const c400 = Color(0xFF1D9E75);
}

class _Amber {
  static const c50 = Color(0xFFFAEEDA);
  static const c400 = Color(0xFFBA7517);
  static const c800 = Color(0xFF633806);
}

class _Warm {
  static const c100 = Color(0xFFF1EFE8);
  static const c200 = Color(0xFFD3D1C7);
  static const c800 = Color(0xFF444441);
}

class AppColors {
  AppColors._();

  /// Surfaces

  static const background = Color(0xFFF6F3ED);
  static const surface = Colors.white;
  static const surfaceMuted = Color(0xFFF2EFE9);

  /// Text

  static const textPrimary = Color(0xFF1C1B18);
  static const textSecondary = Color(0xFF52504A);
  static const textOnMuted = _Warm.c800;

  /// Structure

  static const border = Color(0xFFE8E1D5);

  static const disabledBg = _Warm.c100;
  static const disabledBorder = _Warm.c200;
  static const disabledText = _Warm.c200;

  /// Brand / Primary

  static const primary = Color(0xFF0E7A55);
  static const primaryHover = Color(0xFF005832);
  static const primaryPressed = Color(0xFF005832);
  static const primaryMuted = Color(0xFFEBF6EE);
  static const primaryBorderMuted = _Teal.c100;
  static const focusRing = _Teal.c400;

  /// Financial value

  static const accentValue = Color(0xFFEA580C);
  static const accentValueMuted = _Amber.c50;

  /// Text Inverse
  static const textInverse = Colors.white;

  /// Semantic status

  static const successBg = Color(0xFFEAF3DE);
  static const successBorder = Color(0xFF639922);
  static const successText = Color(0xFF27500A);

  static const warningBg = _Amber.c50;
  static const warningBorder = _Amber.c400;
  static const warningText = _Amber.c800;

  static const dangerBg = Color(0xFFFCEBEB);
  static const dangerBorder = Color(0xFFE24B4A);
  static const dangerText = Color(0xFF791F1F);

  static const infoBg = Color(0xFFE6F1FB);
  static const infoBorder = Color(0xFF378ADD);
  static const infoText = Color(0xFF0C447C);
}

class AppDarkColors {
  AppDarkColors._();

  static const background = Color(0xFF141413);
  static const surface = Color(0xFF1C1C1A);
  static const surfaceMuted = Color(0xFF262624);

  static const textPrimary = Color(0xFFF7F2E9);
  static const textSecondary = Color(0xFFA8A69E);
  static const textOnMuted = Color(0xFFD3D1C7);

  static const border = Color(0xFF383834);
  static const disabledBg = surfaceMuted;
  static const disabledBorder = border;
  static const disabledText = Color(0xFF5F5E5A);

  static const primary = Color(0xFF1D9E75);
  static const primaryHover = Color(0xFF26B386);
  static const primaryPressed = Color(0xFF137758);
  static const primaryMuted = Color(0xFF08382E);
  static const primaryBorderMuted = Color(0xFF0F6E56);
  static const focusRing = Color(0x665DCAA5);

  static const accentValue = Color(0xFFFAC775);
  static const accentValueMuted = Color(0xFF2D1D05);

  static const textInverse = Color(0xFF141413);

  static const successBg = Color(0xFF16280B);
  static const successBorder = Color(0xFF4B7919);
  static const successText = Color(0xFFC0E894);

  static const warningBg = Color(0xFF2D1D05);
  static const warningBorder = Color(0xFF8A550C);
  static const warningText = Color(0xFFFCDCA5);

  static const dangerBg = Color(0xFF2D0D0D);
  static const dangerBorder = Color(0xFFA82F2F);
  static const dangerText = Color(0xFFFCA5A5);

  static const infoBg = Color(0xFF0B1E33);
  static const infoBorder = Color(0xFF2465A8);
  static const infoText = Color(0xFFA8D1FA);
}
