import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/comment_list/comment_list.dart';

class CommentTopLevelDivider extends StatelessWidget {
  const CommentTopLevelDivider(
    this.comment, {
    super.key,
  });

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: comment.isExpanded ? AppSpacing.lg : AppSpacing.xs,
        bottom: AppSpacing.xs,
      ),
      child: const Divider(height: 1),
    );
  }
}
