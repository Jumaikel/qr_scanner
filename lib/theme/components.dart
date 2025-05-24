import 'package:flutter/material.dart';

class M3AppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const M3AppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return AppBar(
      title: Text(title, style: Theme.of(context).textTheme.titleLarge),
      backgroundColor: cs.primaryContainer,
      foregroundColor: cs.onPrimaryContainer,
      centerTitle: true,
      elevation: 0,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class M3FAB extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final String? tooltip;

  const M3FAB({
    super.key,
    required this.onPressed,
    required this.icon,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      backgroundColor: cs.secondary,
      foregroundColor: cs.onSecondary,
      elevation: 4,
      child: icon,
    );
  }
}

class M3Card extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;

  const M3Card({super.key, required this.child, this.margin});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: margin ?? const EdgeInsets.all(8),
      color: cs.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: child,
    );
  }
}
