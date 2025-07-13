import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedItemRank extends StatelessWidget {
  const FeedItemRank({super.key});

  @override
  Widget build(BuildContext context) {
    final rank = context.select(
      (AppFeedItemData data) => data.rank,
    );

    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 24,
        minHeight: 24,
      ),
      child: Center(
        child: FittedBox(
          child: Text(
            rank,
            style: textTheme.titleMedium?.copyWith(
              fontSize: 16,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}
