import 'package:flutter/material.dart';

class CheckoutChoice extends StatelessWidget {
  const CheckoutChoice({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Material(
    color: selected ? const Color(0xFF1C1B17) : Colors.white,
    borderRadius: BorderRadius.circular(14),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          border: selected ? null : Border.all(color: const Color(0xFFE8E1D5)),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 17, color: selected ? Colors.white : const Color(0xFF1C1B17)),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: selected ? Colors.white : const Color(0xFF1C1B17),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
