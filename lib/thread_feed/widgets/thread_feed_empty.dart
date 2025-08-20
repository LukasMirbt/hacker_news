import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ThreadFeedEmpty extends StatelessWidget {
  const ThreadFeedEmpty({super.key});

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
                Symbols.forum_rounded,
                color: colorScheme.secondary,
                size: 40,
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'No threads yet',
                style: textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Your replies and comment threads will appear here. Join a discussion to get started.',
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
