import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppEmptyView extends StatelessWidget {
  const AppEmptyView({
    required this.icon,
    required this.title,
    required this.body,
    super.key,
  });

  final IconData icon;
  final String title;
  final String body;

  static const double _iconSize = 40;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xlg,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcon.filled(
                icon,
                color: colorScheme.secondary,
                size: _iconSize,
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                title,
                style: textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                body,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              const SizedBox(height: _iconSize),
            ],
          ),
        ),
      ),
    );
  }
}
