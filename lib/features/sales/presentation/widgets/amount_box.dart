import 'package:flutter/material.dart';

class AmountBox extends StatelessWidget {
  final String label, value;
  final bool accent;

  const AmountBox({required this.label, required this.value, required this.accent});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: accent ? const Color(0xFFFFEEE6) : const Color(0xFFF6F3ED),
      border: Border.all(color: accent ? const Color(0xFFFFC4A8) : const Color(0xFFE8E1D5)),
      borderRadius: BorderRadius.circular(14),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF8B877B))),
        const SizedBox(height: 4),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: accent ? const Color(0xFFFF6B2C) : const Color(0xFF1C1B17),
            ),
          ),
        ),
      ],
    ),
  );
}
