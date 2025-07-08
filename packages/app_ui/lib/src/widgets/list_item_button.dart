import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ListItemButton extends StatelessWidget {
  const ListItemButton({
    required this.onPressed,
    required this.icon,
    required this.text,
    super.key,
  });

  final void Function() onPressed;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    return IconButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        alignment: Alignment.centerLeft,
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: AppSpacing.md),
        ),
        minimumSize: WidgetStatePropertyAll(
          Size(64, 48),
        ),
      ),
      icon: Row(
        spacing: AppSpacing.xs,
        children: [
          Icon(
            icon,
            size: 16,
            color: colorScheme.onSurfaceVariant,
          ),
          Text(
            text,
            style: textTheme.labelMedium?.copyWith(
              height: 1,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
