import 'package:flutter/material.dart';

@immutable
class AppSpacingExtension extends ThemeExtension<AppSpacingExtension> {
  final double xs; // 4
  final double sm; // 8
  final double md; // 16
  final double lg; // 24
  final double xl; // 32
  final double xl2; // 48
  final double touchTargetMin; // 44

  const AppSpacingExtension({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xl2,
    required this.touchTargetMin,
  });

  factory AppSpacingExtension.standard() {
    return const AppSpacingExtension(
      xs: 4,
      sm: 8,
      md: 16,
      lg: 24,
      xl: 32,
      xl2: 48,
      touchTargetMin: 44,
    );
  }

  @override
  AppSpacingExtension copyWith({
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xl2,
    double? touchTargetMin,
  }) {
    return AppSpacingExtension(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xl2: xl2 ?? this.xl2,
      touchTargetMin: touchTargetMin ?? this.touchTargetMin,
    );
  }

  @override
  AppSpacingExtension lerp(
    ThemeExtension<AppSpacingExtension>? other,
    double t,
  ) {
    if (other is! AppSpacingExtension) return this;

    return AppSpacingExtension(
      xs: _lerp(xs, other.xs, t),
      sm: _lerp(sm, other.sm, t),
      md: _lerp(md, other.md, t),
      lg: _lerp(lg, other.lg, t),
      xl: _lerp(xl, other.xl, t),
      xl2: _lerp(xl2, other.xl2, t),
      touchTargetMin: _lerp(touchTargetMin, other.touchTargetMin, t),
    );
  }

  static double _lerp(double a, double b, double t) {
    return a + (b - a) * t;
  }
}
