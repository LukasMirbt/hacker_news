import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedItemTitle extends StatelessWidget {
  const FeedItemTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final title = context.select(
      (AppFeedItemData data) => data.title,
    );

    final hasBeenVisited = context.select(
      (AppFeedItemData data) => data.hasBeenVisited,
    );

    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    final color = hasBeenVisited
        ? colorScheme.onSurfaceVariant
        : colorScheme.onSurface;

    return Text(
      title,
      style: textTheme.titleMedium?.copyWith(
        color: color,
      ),
    );
  }
}
