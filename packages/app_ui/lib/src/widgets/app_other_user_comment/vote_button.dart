import 'package:app_ui/src/widgets/app_other_user_comment/app_other_user_comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VoteButton extends StatelessWidget {
  const VoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final onVotePressed = context.select(
      (AppOtherUserCommentData data) => data.onVotePressed,
    );

    final size = context.select(
      (AppOtherUserCommentData data) => data.voteIconSize,
    );

    final colorScheme = ColorScheme.of(context);

    final color = context.select(
      (AppOtherUserCommentData data) => data.voteIconColor(colorScheme),
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
