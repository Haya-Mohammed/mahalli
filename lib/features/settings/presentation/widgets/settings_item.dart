import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem(this.icon, this.title, this.subtitle, this.onTap);

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      contentPadding: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: colors.primaryContainer,
        child: Icon(icon, color: colors.primary, size: 19),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
      subtitle: Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
      trailing: Icon(
        Directionality.of(context) == TextDirection.rtl ? Icons.chevron_left : Icons.chevron_right,
        size: 20,
      ),
      onTap: onTap,
    );
  }
}
