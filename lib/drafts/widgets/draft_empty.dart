import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class DraftEmpty extends StatelessWidget {
  const DraftEmpty({super.key});

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
                Symbols.drafts_rounded,
                color: colorScheme.secondary,
                size: 40,
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'No drafts saved',
                style: textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Your unfinished replies and comments will appear here. Drafts are saved automatically.',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
