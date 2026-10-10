import 'package:flutter/material.dart';

class SettingsGroup extends StatelessWidget {
  const SettingsGroup({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Card(
    margin: EdgeInsets.zero,
    clipBehavior: Clip.antiAlias,
    child: Column(
      children: [
        for (var i = 0; i < children.length; i++) ...[
          if (i > 0) const Divider(height: 1, indent: 58),
          children[i],
        ],
      ],
    ),
  );
}
