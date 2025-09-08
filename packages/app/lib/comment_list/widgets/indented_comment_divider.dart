import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class IndentedCommentDivider extends StatelessWidget {
  const IndentedCommentDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommentIndent(
      child: CommentBackground(
        child: SizedBox(height: AppSpacing.sm),
      ),
    );
  }
}
