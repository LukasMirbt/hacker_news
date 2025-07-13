import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedItemVoteButton extends StatelessWidget {
  const FeedItemVoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final visible = context.select(
      (AppFeedItemData data) => data.score != null,
    );

    return InvisiblePlaceholder(
      visible: visible,
      child: const _Button(),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    final onVotePressed = context.select(
      (AppFeedItemData data) => data.onVotePressed,
    );

    return TextButton(
      onPressed: onVotePressed,
      style: const ButtonStyle(
        alignment: Alignment.centerLeft,
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        ),
        minimumSize: WidgetStatePropertyAll(
          Size(64, 48),
        ),
      ),
      child: const Row(
        spacing: AppSpacing.xs,
        children: [
          _Icon(),
          _Text(),
        ],
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon();

  @override
  Widget build(BuildContext context) {
    final hasBeenUpvoted = context.select(
      (AppFeedItemData data) => data.hasBeenUpvoted,
    );

    final colorScheme = ColorScheme.of(context);

    Color color;

    if (hasBeenUpvoted) {
      color = colorScheme.onSurface;
    } else {
      color = colorScheme.onSurfaceVariant;
    }

    return Icon(
      Icons.arrow_upward,
      size: 18,
      color: color,
    );
  }
}

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(BuildContext context) {
    final score = context.select(
      (AppFeedItemData data) => data.score,
    );

    final hasBeenUpvoted = context.select(
      (AppFeedItemData data) => data.hasBeenUpvoted,
    );

    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    Color color;
    FontVariation weight;

    if (hasBeenUpvoted) {
      color = colorScheme.onSurface;
      weight = const FontVariation.weight(700);
    } else {
      color = colorScheme.onSurfaceVariant;
      weight = const FontVariation.weight(500);
    }

    return Text(
      score ?? '0',
      style: textTheme.bodySmall?.copyWith(
        height: 1,
        color: color,
        fontVariations: [weight],
      ),
    );
  }
}
