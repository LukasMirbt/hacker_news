import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VoteButton extends StatelessWidget {
  const VoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final onVotePressed = context.select(
      (AppOtherUserCommentData data) => data.onVotePressed,
    );

    final grade = context.select(
      (AppOtherUserCommentData data) => data.voteIconGrade,
    );

    final colorScheme = ColorScheme.of(context);

    final color = context.select(
      (AppOtherUserCommentData data) => data.voteIconColor(colorScheme),
    );

    return IconButton(
      onPressed: onVotePressed,
      icon: AppIcon(
        Symbols.arrow_upward_rounded,
        size: 20,
        grade: grade,
        color: color,
      ),
    );
  }
}
