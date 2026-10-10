import 'package:flutter/material.dart';

class AppSizes {
  AppSizes._();

  /// Horizontal padding that keeps long lists readable on tablets.
  static EdgeInsets pagePadding(BuildContext context, {double max = 720}) {
    final side = ((MediaQuery.sizeOf(context).width - max) / 2).clamp(0.0, double.infinity);
    return EdgeInsets.fromLTRB(side + 16, 16, side + 16, 16);
  }
}
