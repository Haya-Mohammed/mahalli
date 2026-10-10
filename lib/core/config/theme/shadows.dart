import 'package:flutter/material.dart';

class AppShadows {
  AppShadows._();

  static const sm = [
    BoxShadow(color: Color(0x0F2C2C2A), offset: Offset(0, 1), blurRadius: 2),
  ];

  static const md = [
    BoxShadow(color: Color(0x142C2C2A), offset: Offset(0, 2), blurRadius: 6),
  ];

  static const lg = [
    BoxShadow(color: Color(0x1F2C2C2A), offset: Offset(0, 8), blurRadius: 24),
  ];

  static const focus = [
    BoxShadow(color: Color(0x591D9E75), offset: Offset.zero, blurRadius: 3),
  ];
}
