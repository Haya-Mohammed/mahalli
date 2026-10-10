import 'package:flutter/material.dart';

class AppMotion {
  AppMotion._();

  static const fast = Duration(milliseconds: 120); // color/press feedback
  static const base = Duration(milliseconds: 200); // card reveal
  static const slow = Duration(milliseconds: 320); // bottom sheet / route
  static const easing = Cubic(0.4, 0.0, 0.2, 1.0);

  static Duration resolve(BuildContext context, Duration duration) {
    final reduceMotion =
        MediaQuery.maybeOf(context)?.disableAnimations ?? false;
    return reduceMotion ? Duration.zero : duration;
  }
}
