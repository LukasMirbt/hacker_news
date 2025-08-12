import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

export 'app_feed_item_vote_button_data.dart';
export 'app_feed_item_vote_button_data_placeholder.dart';

class AppFeedItemVoteButton extends StatelessWidget {
  const AppFeedItemVoteButton({
    required this.data,
    super.key,
  });

  final AppFeedItemVoteButtonData data;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: data,
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final onPressed = context.select(
      (AppFeedItemVoteButtonData data) => data.onPressed,
    );

    return TextButton(
      onPressed: onPressed,
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
    final colorScheme = ColorScheme.of(context);

    final color = context.select(
      (AppFeedItemVoteButtonData data) => data.color(colorScheme),
    );

    return AppIcon(
      Symbols.arrow_upward_rounded,
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
      (AppFeedItemVoteButtonData data) => data.score,
    );

    final colorScheme = ColorScheme.of(context);

    final color = context.select(
      (AppFeedItemVoteButtonData data) => data.color(colorScheme),
    );

    final weight = context.select(
      (AppFeedItemVoteButtonData data) => data.weight,
    );

    return Text(
      score,
      style: TextStyle(
        color: color,
        fontVariations: [
          FontVariation.weight(weight),
        ],
      ),
    );
  }
}
