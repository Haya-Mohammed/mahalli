import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mahalli/core/config/theme/colors.dart';
import 'package:mahalli/core/config/routes/routes.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/core/widgets/state_views.dart';
import 'package:mahalli/features/home/domain/dashboard_summary.dart';
import 'package:mahalli/features/home/presentation/home_cubit.dart';
import 'package:mahalli/features/home/presentation/screens/notifications_page.dart';
import 'package:mahalli/features/onboarding/presentation/cubit/shop_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.onNewSale,
    required this.onAddProduct,
    required this.onReceivePayment,
    this.onAddCustomer,
    this.onAddExpense,
    this.onViewDebts,
    this.onViewInventory,
    this.onViewReports,
    this.onViewSales,
    this.onViewSale,
  });

  final VoidCallback onNewSale, onAddProduct, onReceivePayment;
  final VoidCallback? onAddCustomer,
      onAddExpense,
      onViewDebts,
      onViewInventory,
      onViewReports,
      onViewSales;
  final ValueChanged<int>? onViewSale;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  Timer? _midnightTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _scheduleMidnight();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && mounted) {
      context.read<HomeCubit>().load(refresh: true);
      _scheduleMidnight();
    }
  }

  void _scheduleMidnight() {
    _midnightTimer?.cancel();
    final now = DateTime.now();
    final next = DateTime(now.year, now.month, now.day + 1);
    _midnightTimer = Timer(next.difference(now), () {
      if (!mounted) return;
      context.read<HomeCubit>().load(refresh: true);
      _scheduleMidnight();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _midnightTimer?.cancel();
    super.dispose();
  }

  void _openNotifications() {
    final homeCubit = context.read<HomeCubit>();
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => BlocProvider.value(
          value: homeCubit,
          child: const NotificationsPage(),
        ),
      ),
    );
  }

  Future<void> _openStockAlert(DashboardStockAlert alert) async {
    await Navigator.of(
      context,
    ).pushNamed<void>(AppRoutes.stockDetail, arguments: alert.productId);
    if (mounted) context.read<HomeCubit>().load(refresh: true);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeCubit>().state;
    final summary = state.summary;
    final l = context.l10n;
    if (summary == null && state.status == HomeStatus.error) {
      return ErrorView(
        message: l.genericError,
        onRetry: context.read<HomeCubit>().load,
      );
    }
    return ColoredBox(
      color: _Design.background(context),
      child: RefreshIndicator(
        onRefresh: () => context.read<HomeCubit>().load(refresh: true),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 24),
          children: [
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 880),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _Header(
                      shopName:
                          context.watch<ShopCubit>().state.shop?.name ?? '',
                      hasAlerts: (summary?.lowStockCount ?? 0) > 0,
                      onAlerts: _openNotifications,
                    ),
                    if (state.refreshing) ...[
                      const SizedBox(height: 12),
                      const LinearProgressIndicator(minHeight: 2),
                    ],
                    if (state.status == HomeStatus.error &&
                        summary != null) ...[
                      const SizedBox(height: 12),
                      MaterialBanner(
                        content: Text(l.genericError),
                        actions: [
                          TextButton(
                            onPressed: context.read<HomeCubit>().load,
                            child: Text(l.retry),
                          ),
                        ],
                      ),
                    ],
                    const SizedBox(height: 16),
                    if (summary == null)
                      const _Skeleton()
                    else ...[
                      _ProfitPanel(
                        summary: summary,
                        onNewSale: widget.onNewSale,
                        onReports: widget.onViewReports,
                      ),
                      const SizedBox(height: 12),
                      _Stats(
                        summary: summary,
                        onSales: widget.onViewSales,
                        onDebts: widget.onViewDebts,
                        onExpenses: widget.onAddExpense,
                        onInventory: widget.onViewInventory,
                      ),
                      const SizedBox(height: 20),
                      _SectionTitle(l.quickActions),
                      const SizedBox(height: 12),
                      _Actions(
                        actions: [
                          _Action(
                            l.newSale,
                            Icons.shopping_basket_outlined,
                            widget.onNewSale,
                            primary: true,
                          ),
                          _Action(
                            l.addProduct,
                            Icons.inventory_2_outlined,
                            widget.onAddProduct,
                          ),
                          _Action(
                            l.addCustomer,
                            Icons.person_add_alt_1_outlined,
                            widget.onAddCustomer,
                          ),
                          _Action(
                            l.receivePayment,
                            Icons.payments_outlined,
                            widget.onReceivePayment,
                          ),
                          _Action(
                            l.addExpense,
                            Icons.receipt_long_outlined,
                            widget.onAddExpense,
                          ),
                          _Action(
                            l.homeStockCount,
                            Icons.search_rounded,
                            widget.onViewInventory,
                            accent: true,
                          ),
                        ],
                      ),
                      if (summary.productCount == 0) ...[
                        const SizedBox(height: 20),
                        _Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l.homeWelcome,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const SizedBox(height: 4),
                              Text(l.homeWelcomeHint),
                              const SizedBox(height: 12),
                              FilledButton.icon(
                                onPressed: widget.onAddProduct,
                                icon: const Icon(Icons.add),
                                label: Text(l.addProduct),
                              ),
                            ],
                          ),
                        ),
                      ],
                      const SizedBox(height: 20),
                      _SectionTitle(
                        l.homeImportantAlerts,
                        action: l.tabInventory,
                        onAction: widget.onViewInventory,
                      ),
                      const SizedBox(height: 12),
                      if (summary.stockAlerts.isEmpty)
                        _Card(
                          child: Text(
                            l.homeNoAlerts,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        )
                      else
                        ...summary.stockAlerts
                            .take(2)
                            .map(
                              (a) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: _AlertRow(
                                  alert: a,
                                  onTap: () => _openStockAlert(a),
                                ),
                              ),
                            ),
                      const SizedBox(height: 12),
                      _SectionTitle(
                        l.homeRecentSales,
                        action: l.saleHistory,
                        onAction: widget.onViewSales,
                      ),
                      const SizedBox(height: 12),
                      _Card(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: summary.recentSales.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                child: Text(
                                  l.noSales,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              )
                            : Column(
                                children: [
                                  for (
                                    var i = 0;
                                    i < summary.recentSales.length;
                                    i++
                                  ) ...[
                                    if (i > 0)
                                      Divider(
                                        height: 1,
                                        color: _Design.border(context),
                                      ),
                                    _SaleRow(
                                      sale: summary.recentSales[i],
                                      onTap: widget.onViewSale == null
                                          ? widget.onViewSales
                                          : () => widget.onViewSale!(
                                              summary.recentSales[i].id,
                                            ),
                                    ),
                                  ],
                                ],
                              ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Design {
  static bool dark(BuildContext c) => Theme.of(c).brightness == Brightness.dark;
  static Color background(BuildContext c) =>
      dark(c) ? AppDarkColors.background : const Color(0xFFF6F3ED);
  static Color card(BuildContext c) =>
      dark(c) ? AppDarkColors.surface : Colors.white;
  static Color border(BuildContext c) =>
      dark(c) ? AppDarkColors.border : const Color(0xFFE8E1D5);
  static Color foreground(BuildContext c) =>
      dark(c) ? AppDarkColors.textPrimary : const Color(0xFF1C1B17);
  static Color muted(BuildContext c) =>
      dark(c) ? AppDarkColors.textSecondary : const Color(0xFF8B877B);
  static Color primary(BuildContext c) =>
      dark(c) ? AppDarkColors.primary : const Color(0xFF0E7A55);
  static Color secondary(BuildContext c) =>
      dark(c) ? AppDarkColors.primaryMuted : const Color(0xFFE5F1E9);
  static const accent = Color(0xFFFF6B2C);
}

class _Header extends StatelessWidget {
  const _Header({
    required this.shopName,
    required this.hasAlerts,
    this.onAlerts,
  });
  final String shopName;
  final bool hasAlerts;
  final VoidCallback? onAlerts;
  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final locale = Localizations.localeOf(context).languageCode;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat(
                  'EEEE d MMMM • HH:mm',
                  locale,
                ).format(DateTime.now()),
                style: TextStyle(
                  fontSize: 12,
                  color: _Design.muted(context),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      shopName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: _Design.foreground(context),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(Icons.shopping_cart_outlined, size: 22),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: _Design.secondary(context),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 8,
                      color: _Design.primary(context),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        '${l.workingLocally} • ${l.homeLocalData}',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: _Design.primary(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Material(
          color: _Design.card(context),
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: onAlerts,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(color: _Design.border(context)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.notifications_none_rounded,
                    color: _Design.foreground(context),
                  ),
                  if (hasAlerts)
                    const PositionedDirectional(
                      top: 9,
                      end: 9,
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: _Design.accent,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfitPanel extends StatelessWidget {
  const _ProfitPanel({
    required this.summary,
    required this.onNewSale,
    this.onReports,
  });
  final DashboardSummary summary;
  final VoidCallback onNewSale;
  final VoidCallback? onReports;
  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    const ink = Colors.white;
    final panelColor = _Design.dark(context)
        ? AppDarkColors.surfaceMuted
        : const Color(0xFF1D1C19);
    final details = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l.netProfit,
          style: TextStyle(fontSize: 12, color: ink.withValues(alpha: .75)),
        ),
        const SizedBox(height: 4),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            context.money(Money(summary.todayProfitMinor)),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: ink,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${l.todaySales}: ${context.money(Money(summary.todaySalesMinor))} • ${summary.todaySaleCount} ${l.salesCountReport}',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: ink.withValues(alpha: .8),
          ),
        ),
      ],
    );
    final buttons = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _PanelButton(
          '${l.newSale} +',
          onNewSale,
          _Design.primary(context),
          Colors.white,
        ),
        const SizedBox(height: 8),
        _PanelButton(l.reports, onReports, ink.withValues(alpha: .15), ink),
      ],
    );
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: LayoutBuilder(
        builder: (_, box) => box.maxWidth < 330
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [details, const SizedBox(height: 12), buttons],
              )
            : Row(
                children: [
                  Expanded(child: details),
                  const SizedBox(width: 12),
                  SizedBox(width: 100, child: buttons),
                ],
              ),
      ),
    );
  }
}

class _PanelButton extends StatelessWidget {
  const _PanelButton(this.label, this.onTap, this.color, this.foreground);
  final String label;
  final VoidCallback? onTap;
  final Color color, foreground;
  @override
  Widget build(BuildContext context) => Material(
    color: color,
    borderRadius: BorderRadius.circular(14),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 9),
        child: Center(
          child: Text(
            label,
            maxLines: 1,
            style: TextStyle(
              color: foreground,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    ),
  );
}

class _Stats extends StatelessWidget {
  const _Stats({
    required this.summary,
    this.onSales,
    this.onDebts,
    this.onExpenses,
    this.onInventory,
  });
  final DashboardSummary summary;
  final VoidCallback? onSales, onDebts, onExpenses, onInventory;
  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final stats = [
      (
        l.todaySales,
        context.money(Money(summary.todaySalesMinor)),
        '${summary.todaySaleCount} ${l.salesCountReport}',
        onSales,
      ),
      (
        l.outstandingDebt,
        context.money(Money(summary.outstandingDebtMinor)),
        l.debtsOverview,
        onDebts,
      ),
      (
        l.homeTodayExpenses,
        context.money(Money(summary.todayExpensesMinor)),
        l.expenses,
        onExpenses,
      ),
      (
        l.lowStockCount,
        summary.lowStockCount.toString(),
        l.homeOutOfStock(summary.outOfStockCount.toString()),
        onInventory,
      ),
    ];
    return LayoutBuilder(
      builder: (_, box) {
        final columns = box.maxWidth >= 650 ? 4 : 2;
        final width = (box.maxWidth - 12 * (columns - 1)) / columns;
        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            for (final s in stats)
              SizedBox(
                width: width,
                child: _Card(
                  onTap: s.$4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s.$1,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: _Design.muted(context),
                        ),
                      ),
                      const SizedBox(height: 4),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          s.$2,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: _Design.foreground(context),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        s.$3,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: _Design.primary(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title, {this.action, this.onAction});
  final String title;
  final String? action;
  final VoidCallback? onAction;
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: _Design.foreground(context),
          ),
        ),
      ),
      if (action != null)
        TextButton(
          onPressed: onAction,
          style: TextButton.styleFrom(
            foregroundColor: _Design.primary(context),
            padding: const EdgeInsets.symmetric(horizontal: 4),
          ),
          child: Text(
            action!,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
    ],
  );
}

class _Action {
  const _Action(
    this.label,
    this.icon,
    this.onTap, {
    this.primary = false,
    this.accent = false,
  });
  final String label;
  final IconData icon;
  final VoidCallback? onTap;
  final bool primary, accent;
}

class _Actions extends StatelessWidget {
  const _Actions({required this.actions});
  final List<_Action> actions;
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (_, box) {
      final columns = box.maxWidth >= 650 ? 6 : 3;
      final width = (box.maxWidth - 12 * (columns - 1)) / columns;
      return Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          for (final a in actions)
            SizedBox(
              width: width,
              child: Column(
                children: [
                  Material(
                    color: a.primary
                        ? _Design.primary(context)
                        : a.accent
                        ? _Design.accent
                        : _Design.card(context),
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      onTap: a.onTap,
                      borderRadius: BorderRadius.circular(20),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: a.primary || a.accent
                                ? null
                                : Border.all(color: _Design.border(context)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            a.icon,
                            size: 28,
                            color: a.primary || a.accent
                                ? Colors.white
                                : _Design.foreground(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    a.label,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: _Design.foreground(context),
                    ),
                  ),
                ],
              ),
            ),
        ],
      );
    },
  );
}

class _AlertRow extends StatelessWidget {
  const _AlertRow({required this.alert, this.onTap});
  final DashboardStockAlert alert;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final out = alert.stockMilli <= 0;
    final l = context.l10n;
    return _Card(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: out ? AppColors.dangerBg : AppColors.warningBg,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              out ? Icons.warning_amber_rounded : Icons.inventory_2_outlined,
              color: out ? AppColors.dangerText : AppColors.warningText,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  alert.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: _Design.foreground(context),
                  ),
                ),
                Text(
                  out
                      ? l.stockOut
                      : l.homeStockRemaining(
                          Quantity(alert.stockMilli).format(),
                        ),
                  style: TextStyle(fontSize: 11, color: _Design.muted(context)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            out
                ? l.addStock
                : l.homeStockThreshold(Quantity(alert.thresholdMilli).format()),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: out ? _Design.primary(context) : _Design.muted(context),
            ),
          ),
        ],
      ),
    );
  }
}

class _SaleRow extends StatelessWidget {
  const _SaleRow({required this.sale, this.onTap});
  final DashboardRecentSale sale;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final locale = Localizations.localeOf(context).languageCode;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _Design.background(context),
                border: Border.all(color: _Design.border(context)),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                Icons.receipt_long_outlined,
                color: _Design.foreground(context),
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${l.saleNumber}${sale.id} • ${sale.customerName ?? l.cash}',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: _Design.foreground(context),
                    ),
                  ),
                  Text(
                    '${DateFormat('d MMM • HH:mm', locale).format(sale.createdAt.toLocal())} • ${sale.remainingMinor > 0 ? l.outstandingDebt : l.paidAmount}',
                    style: TextStyle(
                      fontSize: 11,
                      color: _Design.muted(context),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              context.money(Money(sale.totalMinor)),
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: _Design.foreground(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(12),
  });
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) => Material(
    color: _Design.card(context),
    borderRadius: BorderRadius.circular(20),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          border: Border.all(color: _Design.border(context)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: child,
      ),
    ),
  );
}

class _Skeleton extends StatelessWidget {
  const _Skeleton();
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Container(
        height: 150,
        decoration: BoxDecoration(
          color: _Design.border(context),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      const SizedBox(height: 12),
      Row(
        children: [
          for (var i = 0; i < 2; i++) ...[
            if (i > 0) const SizedBox(width: 12),
            Expanded(
              child: Container(
                height: 90,
                decoration: BoxDecoration(
                  color: _Design.border(context),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ],
      ),
    ],
  );
}
