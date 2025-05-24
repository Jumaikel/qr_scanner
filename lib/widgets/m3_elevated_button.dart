import 'package:flutter/material.dart';

class M3ElevatedButton extends StatelessWidget {
  final String label;

  final VoidCallback onPressed;

  final Widget? icon;

  final bool enabled;

  const M3ElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      textStyle: theme.textTheme.labelLarge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      elevation: 2,
      minimumSize: const Size(64, 48),
    );

    if (icon != null) {
      return ElevatedButton.icon(
        onPressed: enabled ? onPressed : null,
        icon: IconTheme(
          data: IconThemeData(color: colorScheme.onPrimary),
          child: icon!,
        ),
        label: Text(label),
        style: style,
      );
    }

    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: style,
      child: Text(label),
    );
  }
}
