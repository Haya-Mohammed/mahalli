import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mahalli/core/config/routes/router.dart';
import 'package:mahalli/core/config/routes/routes.dart';
import 'package:mahalli/core/database/collections/enums.dart';

void main() {
  test('named routes preserve their settings and result types', () {
    final form = AppRouter.onGenerateRoute(
      const RouteSettings(
        name: AppRoutes.catalogForm,
        arguments: CatalogFormArgs(ItemType.product),
      ),
    );
    expect(form, isA<Route<bool>>());
    expect(form.settings.name, AppRoutes.catalogForm);

    final scanner = AppRouter.onGenerateRoute(
      const RouteSettings(name: AppRoutes.barcodeScanner),
    );
    expect(scanner, isA<Route<String>>());

    final detail = AppRouter.onGenerateRoute(
      const RouteSettings(name: AppRoutes.saleDetail, arguments: 42),
    );
    expect(detail, isA<Route<void>>());

    final saleReturn = AppRouter.onGenerateRoute(
      const RouteSettings(name: AppRoutes.saleReturn, arguments: 42),
    );
    expect(saleReturn, isA<Route<bool>>());
  });

  test('unknown routes fail explicitly', () {
    expect(
      () => AppRouter.onGenerateRoute(const RouteSettings(name: '/missing')),
      throwsArgumentError,
    );
  });
}
