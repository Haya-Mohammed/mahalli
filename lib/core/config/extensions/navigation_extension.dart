import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<T?> push<T>(String route, {Object? arguments}) =>
      Navigator.of(this).pushNamed(route, arguments: arguments);

  void pop<T>([T? result]) => Navigator.of(this).pop(result);

  Future<bool> maybePop<T>([T? result]) => Navigator.of(this).maybePop(result);

  Future<T?> pushNamedAndRemoveUntil<T>(
    String newRoute,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) => Navigator.of(
    this,
  ).pushNamedAndRemoveUntil(newRoute, predicate, arguments: arguments);
}
