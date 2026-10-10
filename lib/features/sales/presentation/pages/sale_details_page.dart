import 'package:mahalli/core/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/core/helpers/formatter.dart';
import 'package:mahalli/core/helpers/sizes.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/core/widgets/app_card.dart';
import 'package:mahalli/core/widgets/state_views.dart';
import 'package:mahalli/features/sales/domain/models/sale_details.dart';
import 'package:mahalli/features/sales/domain/repositories/sales_repository.dart';

class SaleDetailsPage extends StatefulWidget {
  const SaleDetailsPage({super.key, required this.saleId});
  final int saleId;
  @override
  State<SaleDetailsPage> createState() => _SaleDetailsPageState();
}

class _SaleDetailsPageState extends State<SaleDetailsPage> {
  late Future<SaleDetails?> _future = sl<SalesRepository>().details(
    widget.saleId,
  );

  void _retry() => setState(() {
    _future = sl<SalesRepository>().details(widget.saleId);
  });

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l.saleDetails)),
      body: FutureBuilder<SaleDetails?>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          final details = snapshot.data;
          if (snapshot.hasError || details == null) {
            return ErrorView(message: l.genericError, onRetry: _retry);
          }
          final sale = details.sale;
          return ListView(
            padding: AppSizes.pagePadding(context),
            children: [
              AppCard(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('${l.saleNumber}${sale.saleNumber}'),
                      subtitle: Text(
                        AppFormatter.fmtDate(context, sale.createdAt),
                      ),
                    ),
                    ListTile(
                      title: Text(l.total),
                      trailing: Text(context.money(Money(sale.totalAmount))),
                    ),
                    ListTile(
                      title: Text(l.paidAmount),
                      trailing: Text(context.money(Money(sale.paidAmount))),
                    ),
                    if (sale.remainingAmount > 0)
                      ListTile(
                        title: Text(l.remaining),
                        trailing: Text(
                          context.money(Money(sale.remainingAmount)),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              AppCard(
                child: Column(
                  children: details.lines
                      .map(
                        (line) => ListTile(
                          title: Text(line.item.name),
                          subtitle: Text(Quantity(line.quantityMilli).format()),
                          trailing: Text(context.money(Money(line.totalMinor))),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.tonalIcon(
                      onPressed: () => Navigator.of(context).pushNamed<void>(
                        AppRoutes.receipt,
                        arguments: ReceiptArgs(widget.saleId),
                      ),
                      icon: const Icon(Icons.receipt_outlined),
                      label: Text(l.receipt),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FilledButton.tonalIcon(
                      onPressed: () => Navigator.of(context).pushNamed<bool>(
                        AppRoutes.saleReturn,
                        arguments: widget.saleId,
                      ),
                      icon: const Icon(Icons.assignment_return_outlined),
                      label: Text(l.returnItems),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
