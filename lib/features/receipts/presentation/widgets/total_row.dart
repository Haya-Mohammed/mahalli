import 'package:flutter/material.dart';

class TotalRow extends StatelessWidget {
  final String label;
  final String value;
  final bool bold;
  final Color? color;

  const TotalRow(this.label, this.value, {this.bold = false, this.color});

  @override
  Widget build(BuildContext context) {
    final style =
        (bold ? Theme.of(context).textTheme.titleMedium : Theme.of(context).textTheme.bodyMedium)
            ?.copyWith(color: color);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(child: Text(label, style: style)),
          Text(value, style: style),
        ],
      ),
    );
  }
}
