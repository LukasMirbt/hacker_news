import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostHeaderCommentButton extends StatelessWidget {
  const PostHeaderCommentButton({super.key});

  @override
  Widget build(BuildContext context) {
    final commentButton = context.select(
      (AppPostHeaderData data) => data.commentButton,
    );

    if (commentButton != null) return commentButton;

    return const PostHeaderButtonPlaceholder();
  }
}
