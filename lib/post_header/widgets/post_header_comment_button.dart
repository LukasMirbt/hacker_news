import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';

class PostHeaderCommentButton extends StatelessWidget {
  const PostHeaderCommentButton({
    required this.commentCount,
    super.key,
  });

  final String commentCount;

  @override
  Widget build(BuildContext context) {
    return AppPostHeaderCommentButton(
      data: AppPostHeaderCommentButtonData(
        commentCount: commentCount,
        onPressed: () {
          AppRouter.of(context).goRelative(
            const CommentFormRoute(),
          );
        },
      ),
    );
  }
}
