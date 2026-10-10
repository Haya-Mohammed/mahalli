import 'package:flutter/material.dart';
import 'package:mahalli/core/money/money.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';

class ProfitLine extends StatelessWidget {
  final String label;
  final int amount;
  final bool bold;

  const ProfitLine(this.label, this.amount, {this.bold = false});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(color: Colors.white70, fontWeight: bold ? FontWeight.w800 : null),
          ),
        ),
        Text(
          context.money(Money(amount)),
          style: TextStyle(
            color: Colors.white,
            fontWeight: bold ? FontWeight.w800 : FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
