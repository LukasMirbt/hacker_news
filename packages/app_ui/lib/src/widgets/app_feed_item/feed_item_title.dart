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

    final colorScheme = ColorScheme.of(context);

    final color = context.select(
      (AppFeedItemData data) => data.titleColor(colorScheme),
    );

    final textTheme = TextTheme.of(context);

    return Text(
      title,
      style: textTheme.titleMedium?.copyWith(
        color: color,
      ),
    );
  }
}
