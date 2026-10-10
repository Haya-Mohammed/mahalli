import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/core/widgets/state_views.dart';
import 'package:mahalli/features/stock/domain/models/stock_enums.dart';
import 'package:mahalli/features/stock/presentation/cubits/stock_details/stock_details_cubit.dart';
import 'package:mahalli/features/stock/presentation/cubits/stock_details/stock_details_state.dart';
import 'package:mahalli/features/stock/presentation/widgets/stock_action_sheet.dart';

Color _statusColor(BuildContext context, StockStatus status) {
  final colors = Theme.of(context).colorScheme;
  return switch (status) {
    StockStatus.healthy => colors.primary,
    StockStatus.low => colors.secondary,
    StockStatus.out || StockStatus.negative => colors.error,
  };
}

String _movementLabel(BuildContext context, StockMovementType type) {
  final l = context.l10n;
  return switch (type) {
    StockMovementType.opening => l.movementOpening,
    StockMovementType.purchase => l.movementPurchase,
    StockMovementType.sale => l.movementSale,
    StockMovementType.returnIn => l.movementReturn,
    StockMovementType.adjustment => l.movementAdjustment,
    StockMovementType.damage => l.movementDamage,
  };
}

String _statusLabel(BuildContext context, StockStatus status) {
  final l = context.l10n;
  return switch (status) {
    StockStatus.healthy => l.stockHealthy,
    StockStatus.low => l.stockLow,
    StockStatus.out => l.stockOut,
    StockStatus.negative => l.stockNegative,
  };
}

class StockDetailBody extends StatelessWidget {
  const StockDetailBody({required this.productId});
  final int productId;

  Future<void> _showAction(BuildContext context, StockAction action) async {
    final cubit = context.read<StockDetailCubit>();
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => BlocProvider.value(
        value: cubit,
        child: StockActionSheet(action: action),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final cubit = context.read<StockDetailCubit>();
    final state = context.watch<StockDetailCubit>().state;
    final product = state.product;
    return Scaffold(
      appBar: AppBar(title: Text(product?.name ?? l.stock)),
      body: product == null
          ? state.status == StockLoadStatus.failure
                ? ErrorView(
                    message: l.genericError,
                    onRetry: () => cubit.load(productId),
                  )
                : const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () => cubit.load(productId),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l.currentStock,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${Quantity(product.quantityMilli).format()} ${l.unitLabel(product.unit)}',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _statusLabel(context, product.status),
                            style: TextStyle(
                              color: _statusColor(context, product.status),
                            ),
                          ),
                          Text(
                            '${l.lowStockThreshold}: ${Quantity(product.thresholdMilli).format()}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      FilledButton.icon(
                        onPressed: state.busy
                            ? null
                            : () => _showAction(context, StockAction.add),
                        icon: const Icon(Icons.add),
                        label: Text(l.addStock),
                      ),
                      OutlinedButton.icon(
                        onPressed: state.busy
                            ? null
                            : () => _showAction(context, StockAction.adjust),
                        icon: const Icon(Icons.fact_check_outlined),
                        label: Text(l.adjustStock),
                      ),
                      OutlinedButton.icon(
                        onPressed: state.busy
                            ? null
                            : () => _showAction(context, StockAction.damage),
                        icon: const Icon(Icons.broken_image_outlined),
                        label: Text(l.recordDamage),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    l.stockHistory,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  if (state.movements.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: Text(
                        l.stockNoHistory,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ...state.movements.map(
                    (movement) => Card(
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 15,
                        ),

                        title: Text(_movementLabel(context, movement.type)),
                        subtitle: Text(
                          [
                            DateFormat.yMd(
                              Localizations.localeOf(context).languageCode,
                            ).add_jm().format(movement.createdAt),
                            if (movement.note != null) movement.note!,
                          ].join(' • '),
                        ),
                        trailing: Text(
                          '${movement.quantityMilli > 0 ? '+' : ''}${Quantity(movement.quantityMilli).format()}',
                        ),
                      ),
                    ),
                  ),
                  if (state.hasMore)
                    OutlinedButton(
                      onPressed: state.loadingMore ? null : cubit.loadMore,
                      child: Text(l.loadMore),
                    ),
                ],
              ),
            ),
    );
  }
}
