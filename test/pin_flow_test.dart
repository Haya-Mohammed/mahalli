import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mahalli/core/config/locale/l10n/app_localizations.dart';
import 'package:mahalli/core/config/locale/locale_cubit.dart';
import 'package:mahalli/core/config/locale/locale_storage_service.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/features/home/domain/dashboard_repository.dart';
import 'package:mahalli/features/home/domain/dashboard_summary.dart';
import 'package:mahalli/features/home/domain/get_dashboard_summary.dart';
import 'package:mahalli/features/home/presentation/home_cubit.dart';
import 'package:mahalli/features/onboarding/domain/models/shop_model.dart';
import 'package:mahalli/features/onboarding/domain/repository/shop_repository.dart';
import 'package:mahalli/features/onboarding/domain/usecases/create_shop.dart';
import 'package:mahalli/features/onboarding/presentation/cubit/shop_cubit.dart';
import 'package:mahalli/features/security/data/pin_service.dart';
import 'package:mahalli/features/security/domain/models/pin_record.dart';
import 'package:mahalli/features/security/domain/repositories/pin_hasher.dart';
import 'package:mahalli/features/security/domain/repositories/pin_store.dart';
import 'package:mahalli/features/security/presentation/cubit/pin_cubit.dart';
import 'package:mahalli/features/security/presentation/widgets/pin_lifecycle_watcher.dart';
import 'package:mahalli/features/shell/presentation/app_gate.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _ShopRepo implements ShopRepository {
  @override
  Future<ShopModel?> getShop() async =>
      const ShopModel(name: 'Mahalli', businessType: BusinessType.grocery, currency: 'ILS');
  @override
  Future<ShopModel> createShop(ShopModel details) async => details;
  @override
  Future<ShopModel> updateShop(ShopModel details) async => details;
}

class _PinStore implements PinStore {
  PinRecord? record;
  @override
  Future<PinRecord?> read() async => record;
  @override
  Future<void> write(PinRecord value) async {
    record = value;
  }

  @override
  Future<void> delete() async {
    record = null;
  }
}

class _DashboardRepo implements DashboardRepository {
  @override
  Future<DashboardSummary> loadForDay(DateTime startLocal, DateTime endLocal) async =>
      DashboardSummary.empty;
}

void main() {
  testWidgets('PIN offer, setup and lock protect the shop', (tester) async {
    sl.registerFactory<HomeCubit>(() => HomeCubit(GetDashboardSummary(_DashboardRepo())));
    addTearDown(() => sl.unregister<HomeCubit>());
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final shopRepo = _ShopRepo();
    final shop = ShopCubit(shopRepo, CreateShop(shopRepo))..load();
    final pin = PinCubit(PinService(_PinStore(), PinHasher(iterations: 100)), prefs)..load();
    final navigatorKey = GlobalKey<NavigatorState>();

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<LocaleCubit>(create: (_) => LocaleCubit(LocaleStorageServiceImpl(prefs))),
          BlocProvider<ShopCubit>.value(value: shop),
          BlocProvider<PinCubit>.value(value: pin),
        ],
        child: MaterialApp(
          navigatorKey: navigatorKey,
          locale: const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: (context, child) =>
              PinLifecycleWatcher(navigatorKey: navigatorKey, child: child!),
          home: const AppGate(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Protect your shop with a PIN'), findsOneWidget);

    await tester.tap(find.text('Set PIN'));
    await tester.pumpAndSettle();
    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), '1234');
    await tester.enterText(fields.at(1), '1234');
    await tester.tap(find.widgetWithText(FilledButton, 'Set PIN'));
    await tester.pumpAndSettle();
    expect(pin.state.enabled, isTrue);
    expect(find.text('Mahalli'), findsWidgets);

    pin.lock();
    await tester.pumpAndSettle();
    expect(find.text('Unlock'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), '1234');
    await tester.tap(find.text('Unlock'));
    await tester.pumpAndSettle();
    expect(pin.state.status, PinGateStatus.unlocked);

    var taps = 0;
    navigatorKey.currentState!.push(
      MaterialPageRoute<void>(
        builder: (_) => Scaffold(
          body: Center(
            child: ElevatedButton(onPressed: () => taps++, child: const Text('Behind lock')),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    pin.lock();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Behind lock'), warnIfMissed: false);
    expect(taps, 0);
    await tester.enterText(find.byType(TextFormField), '1234');
    await tester.tap(find.text('Unlock'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Behind lock'));
    expect(taps, 1);

    await shop.close();
    await pin.close();
  });
}
