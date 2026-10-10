import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(4, 22, 4, 8),
    child: Text(
      title,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
    ),
  );
}
