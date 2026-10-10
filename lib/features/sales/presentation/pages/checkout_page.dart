import 'package:mahalli/core/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/database/collections/enums.dart';
import 'package:mahalli/core/di/injection_container.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/features/customers/domain/models/customer_details.dart';
import 'package:mahalli/features/customers/domain/repository/customer_repository.dart';
import 'package:mahalli/features/sales/domain/models/checkout_input.dart';
import 'package:mahalli/features/sales/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:mahalli/features/sales/presentation/cubits/cart_cubit/cart_state.dart';
import 'package:mahalli/features/sales/presentation/cubits/checkout_cubit/checkout_cubit.dart';
import 'package:mahalli/features/sales/presentation/cubits/checkout_cubit/checkout_state.dart';
import 'package:mahalli/features/sales/presentation/widgets/amount_box.dart';
import 'package:mahalli/features/sales/presentation/widgets/checkout_choice.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _paid = TextEditingController();
  int? _customerId;
  List<CustomerDetails> _customers = const [];
  PaymentStatus _choice = PaymentStatus.paid;

  @override
  void initState() {
    super.initState();
    _loadCustomers();
  }

  Future<void> _loadCustomers() async {
    try {
      final rows = await sl<CustomerRepository>().list();
      if (mounted) setState(() => _customers = rows);
    } catch (_) {
      // Cash sales still work without the customer list.
    }
  }

  Future<void> _addCustomer() async {
    await Navigator.of(context).pushNamed<void>(AppRoutes.customers);
    if (mounted) _loadCustomers();
  }

  @override
  void dispose() {
    _paid.dispose();
    super.dispose();
  }

  int _paidMinor(int total) => switch (_choice) {
    PaymentStatus.credit => 0,
    PaymentStatus.paid => total,
    _ => Money.tryParse(_paid.text)?.minor ?? 0,
  };

  Widget _checkoutOrder(BuildContext context, CartState cart) {
    final l = context.l10n;
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border.all(color: const Color(0xFFE8E1D5)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l.checkoutItems(cart.lines.length.toString()),
                  style: theme.textTheme.bodySmall,
                ),
              ),
              Text(
                '${l.total} ${context.money(Money(cart.total))}',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          for (final line in cart.lines)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${line.item.name} ×${Quantity(line.quantityMilli).format()}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelMedium,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    context.money(Money(line.totalMinor)),
                    style: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          const Divider(height: 24),
          Row(
            children: [
              Expanded(
                child: Text(
                  l.total,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Text(
                context.money(Money(cart.total)),
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _paymentOptions(BuildContext context) {
    final l = context.l10n;
    final options = [
      (PaymentStatus.paid, l.checkoutCashFull, Icons.payments_outlined),
      (
        PaymentStatus.credit,
        l.checkoutCreditFull,
        Icons.account_balance_wallet_outlined,
      ),
      (PaymentStatus.partial, l.checkoutPartial, Icons.call_split_outlined),
    ];
    return Row(
      children: [
        for (var i = 0; i < options.length; i++) ...[
          if (i > 0) const SizedBox(width: 8),
          Expanded(
            child: CheckoutChoice(
              label: options[i].$2,
              icon: options[i].$3,
              selected: _choice == options[i].$1,
              onTap: () => setState(() => _choice = options[i].$1),
            ),
          ),
        ],
      ],
    );
  }

  Widget _creditDetails(BuildContext context, int total) {
    final l = context.l10n;
    final theme = Theme.of(context);
    final due = (total - _paidMinor(total)).clamp(0, total);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border.all(color: const Color(0xFF0E7A55), width: 1.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l.checkoutCustomerDebt,
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<int>(
            initialValue: _customerId,
            isExpanded: true,
            decoration: InputDecoration(labelText: l.selectCustomer),
            items: _customers
                .where((row) => row.isActive)
                .map(
                  (row) => DropdownMenuItem(
                    value: row.id,
                    child: Text(row.name, overflow: TextOverflow.ellipsis),
                  ),
                )
                .toList(),
            onChanged: (value) => setState(() => _customerId = value),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: TextButton.icon(
              onPressed: _addCustomer,
              icon: const Icon(Icons.person_add_alt, size: 18),
              label: Text(l.addCustomer),
            ),
          ),
          if (_choice == PaymentStatus.partial) ...[
            const SizedBox(height: 8),
            TextField(
              controller: _paid,
              onChanged: (_) => setState(() {}),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                labelText: l.checkoutPaidNow,
                hintText: Money(total).format(),
              ),
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: AmountBox(
                  label: l.checkoutPaidNow,
                  value: context.money(Money(_paidMinor(total))),
                  accent: false,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AmountBox(
                  label: l.checkoutDue,
                  value: context.money(Money(due)),
                  accent: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = context.read<CartCubit>().state.total;
    return BlocProvider(
      create: (_) => sl<CheckoutCubit>(),
      child: Builder(
        builder: (innerContext) => BlocListener<CheckoutCubit, CheckoutState>(
          listener: (innerContext, state) {
            if (state.status == CheckoutStatus.success) {
              // Return the sale id so the caller can clear the cart and open
              // the receipt.
              Navigator.pop(innerContext, state.sale?.id);
            }
            if (state.status == CheckoutStatus.failure ||
                state.status == CheckoutStatus.invalid) {
              ScaffoldMessenger.of(innerContext).showSnackBar(
                SnackBar(
                  content: Text(
                    state.status == CheckoutStatus.invalid
                        ? innerContext.l10n.invalidPayment
                        : innerContext.l10n.saleFailed,
                  ),
                ),
              );
            }
          },
          child: Scaffold(
            backgroundColor: const Color(0xFFF6F3ED),
            appBar: AppBar(title: Text(innerContext.l10n.checkout)),
            body: SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _checkoutOrder(
                        innerContext,
                        context.read<CartCubit>().state,
                      ),
                      const SizedBox(height: 12),
                      _paymentOptions(innerContext),
                      if (_choice != PaymentStatus.paid) ...[
                        const SizedBox(height: 12),
                        _creditDetails(innerContext, total),
                      ],
                      const SizedBox(height: 12),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Chip(
                          avatar: const Icon(
                            Icons.circle,
                            size: 8,
                            color: Color(0xFF0E7A55),
                          ),
                          label: Text(innerContext.l10n.checkoutLocalSave),
                          backgroundColor: const Color(0xFFE5F1E9),
                          side: BorderSide.none,
                        ),
                      ),
                      const SizedBox(height: 14),
                      BlocBuilder<CheckoutCubit, CheckoutState>(
                        builder: (innerContext, state) {
                          final submitting =
                              state.status == CheckoutStatus.submitting;
                          return FilledButton(
                            style: FilledButton.styleFrom(
                              minimumSize: const Size.fromHeight(52),
                            ),
                            onPressed: submitting
                                ? null
                                : () =>
                                      innerContext.read<CheckoutCubit>().submit(
                                        CheckoutInput(
                                          lines: context
                                              .read<CartCubit>()
                                              .state
                                              .lines,
                                          paidAmount: _paidMinor(total),
                                          customerId:
                                              _choice == PaymentStatus.paid
                                              ? null
                                              : _customerId,
                                        ),
                                      ),
                            child: submitting
                                ? const SizedBox.square(
                                    dimension: 22,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.5,
                                    ),
                                  )
                                : Text(
                                    '${innerContext.l10n.completeSale} • ${innerContext.money(Money(_paidMinor(total)))} ✓',
                                  ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
