// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mahalli/core/config/locale/l10n/app_localizations.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/features/onboarding/domain/models/shop_model.dart';
import 'package:mahalli/features/onboarding/domain/repository/shop_repository.dart';
import 'package:mahalli/features/onboarding/domain/usecases/create_shop.dart';
import 'package:mahalli/features/onboarding/presentation/cubit/shop_cubit.dart';
import 'package:mahalli/features/onboarding/presentation/pages/onboarding_page.dart';

class MemoryShopRepository implements ShopRepository {
  ShopModel? shop;

  @override
  Future<ShopModel?> getShop() async => shop;

  @override
  Future<ShopModel> createShop(ShopModel details) async {
    shop = details;
    return details;
  }

  @override
  Future<ShopModel> updateShop(ShopModel details) async {
    shop = details;
    return details;
  }
}

void main() {
  test('currency precision uses minor units without floating point', () {
    expect(Money.fromDecimal('1.250', currency: 'JOD').minor, 1250);
    expect(const Money(1250).format(currency: 'JOD'), '1.250');
    expect(Money.tryParse('1.250', currency: 'ILS'), isNull);
    expect(Money.fromDecimal('1.25', currency: 'ILS').minor, 125);
  });

  testWidgets('Arabic onboarding validates and saves shop details', (tester) async {
    final repository = MemoryShopRepository();
    await tester.pumpWidget(
      BlocProvider(
        create: (_) => ShopCubit(repository, CreateShop(repository)),
        child: const MaterialApp(
          locale: Locale('ar'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: OnboardingPage(),
        ),
      ),
    );

    expect(Directionality.of(tester.element(find.byType(OnboardingPage))), TextDirection.rtl);
    await tester.tap(find.byType(FilledButton));
    await tester.pump();
    expect(find.text('استخدم من ٢ إلى ٦٠ حرفًا'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'متجر محلي');
    await tester.tap(find.byType(DropdownButtonFormField<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('JD JOD').last);
    await tester.pumpAndSettle();
    await tester.tap(find.byType(FilledButton));
    await tester.pumpAndSettle();
    expect(repository.shop?.name, 'متجر محلي');
    expect(repository.shop?.businessType, BusinessType.grocery);
    expect(repository.shop?.currency, 'JOD');
  });
}
