import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThreadItemVoteButton extends StatelessWidget {
  const ThreadItemVoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final onVotePressed = context.select(
      (AppThreadItemData data) => data.onVotePressed,
    );

    final size = context.select(
      (AppThreadItemData data) => data.voteIconSize,
    );

    final colorScheme = ColorScheme.of(context);

    final color = context.select(
      (AppThreadItemData data) => data.voteIconColor(colorScheme),
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
