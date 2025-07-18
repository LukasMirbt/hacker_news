import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThreadFeedItemVoteButton extends StatelessWidget {
  const ThreadFeedItemVoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final onVotePressed = context.select(
      (AppThreadFeedItemData data) => data.onVotePressed,
    );

    final size = context.select(
      (AppThreadFeedItemData data) => data.voteIconSize,
    );

    final colorScheme = ColorScheme.of(context);

    final color = context.select(
      (AppThreadFeedItemData data) => data.voteIconColor(colorScheme),
    );

    return IconButton(
      onPressed: onVotePressed,
      icon: Icon(
        Icons.arrow_upward,
        size: size,
        color: color,
      ),
    );
  }
}
