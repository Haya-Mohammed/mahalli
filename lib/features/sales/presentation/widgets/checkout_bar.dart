import 'package:flutter/material.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/features/sales/presentation/cubits/cart_cubit/cart_state.dart';

class CheckoutBar extends StatelessWidget {
  final CartState cart;
  final VoidCallback onPressed;
  final VoidCallback onClear;

  const CheckoutBar({required this.cart, required this.onPressed, required this.onClear});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final ink = Theme.of(context).colorScheme.onSurface;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(top: BorderSide(color: Theme.of(context).colorScheme.outlineVariant)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      l.salesItemCount(cart.lines.length.toString()),
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Text(
                    '${l.total} ${context.money(Money(cart.total))}',
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall?.copyWith(color: ink, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: cart.lines.isEmpty ? null : onClear,
                      style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                      child: Text(l.salesClearCart),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: FilledButton(
                      onPressed: cart.lines.isEmpty ? null : onPressed,
                      style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                      child: Text(
                        '${l.checkout} • ${context.money(Money(cart.total))} ←',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
