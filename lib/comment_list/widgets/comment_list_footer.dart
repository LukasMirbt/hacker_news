import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/comment_list/comment_list.dart';

class CommentListFooter extends StatelessWidget {
  const CommentListFooter(
    this.comment, {
    super.key,
  });

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppSpacing.spaceUnit * 2,
      ),
      child: CommentTopLevelDivider(comment),
    );
  }
}
