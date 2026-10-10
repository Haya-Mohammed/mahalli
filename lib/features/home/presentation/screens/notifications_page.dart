import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/config/routes/routes.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/features/home/presentation/home_cubit.dart';

/// Shows the current stock notifications from the home dashboard.
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeCubit>().state;
    final alerts = state.summary?.stockAlerts;
    final l = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l.notifications)),
      body: RefreshIndicator(
        onRefresh: () => context.read<HomeCubit>().load(refresh: true),
        child: alerts == null
            ? const Center(child: CircularProgressIndicator())
            : alerts.isEmpty
            ? ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  const SizedBox(height: 96),
                  Center(child: Text(l.homeNoAlerts)),
                ],
              )
            : ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemCount: alerts.length,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final alert = alerts[index];
                  final out = alert.stockMilli <= 0;
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        out
                            ? Icons.warning_amber_rounded
                            : Icons.inventory_2_outlined,
                        color: out ? Colors.red : Colors.orange,
                      ),
                      title: Text(alert.name),
                      subtitle: Text(
                        out
                            ? l.stockOut
                            : l.homeStockRemaining(
                                Quantity(alert.stockMilli).format(),
                              ),
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () async {
                        await Navigator.of(context).pushNamed<void>(
                          AppRoutes.stockDetail,
                          arguments: alert.productId,
                        );
                        if (context.mounted) {
                          context.read<HomeCubit>().load(refresh: true);
                        }
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
