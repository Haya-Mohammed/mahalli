import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mahalli/core/config/locale/l10n/app_localizations.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/features/onboarding/domain/models/shop_model.dart';
import 'package:mahalli/features/onboarding/domain/repository/shop_repository.dart';
import 'package:mahalli/features/onboarding/domain/usecases/create_shop.dart';
import 'package:mahalli/features/onboarding/presentation/cubit/shop_cubit.dart';
import 'package:mahalli/features/receipts/domain/models/receipt.dart';
import 'package:mahalli/features/receipts/domain/models/receipt_line.dart';
import 'package:mahalli/features/receipts/domain/repository/receipt_repository.dart';
import 'package:mahalli/features/receipts/presentation/pages/receipt_page.dart';

class _ReceiptRepository implements ReceiptRepository {
  @override
  Future<Receipt?> build(int saleId) async => Receipt(
    shopName: 'Test Shop',
    number: saleId,
    createdAt: DateTime(2026, 10, 8),
    lines: const [
      ReceiptLine(name: 'Milk', quantityMilli: 2000, unitPriceMinor: 800, totalMinor: 1600),
    ],
    totalMinor: 1600,
    paidMinor: 1000,
    remainingMinor: 600,
    customerName: 'Customer',
  );
}

class _ShopRepository implements ShopRepository {
  @override
  Future<ShopModel?> getShop() async => null;
  @override
  Future<ShopModel> createShop(ShopModel details) async => details;
  @override
  Future<ShopModel> updateShop(ShopModel details) async => details;
}

void main() {
  testWidgets('receipt shows saved sale and available actions', (tester) async {
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
    await sl.reset();
    addTearDown(sl.reset);
    sl.registerSingleton<ReceiptRepository>(_ReceiptRepository());
    final shop = _ShopRepository();
    final shopCubit = ShopCubit(shop, CreateShop(shop));
    addTearDown(shopCubit.close);

    await tester.pumpWidget(
      BlocProvider.value(
        value: shopCubit,
        child: MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: ReceiptPage(saleId: 42, onNewSale: () {}),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Sale completed!'), findsOneWidget);
    expect(find.text('Test Shop'), findsOneWidget);
    expect(find.text('Milk ×2'), findsOneWidget);
    expect(find.text('New sale +'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
