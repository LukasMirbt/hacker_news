import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CommentListFooter extends StatelessWidget {
  const CommentListFooter(
    this.comment, {
    super.key,
  });

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        bottom: AppSpacing.spaceUnit * 2,
      ),
      child: Column(
        children: [
          SizedBox(height: AppSpacing.lg),
          Divider(),
          SizedBox(height: AppSpacing.xs),
        ],
      ),
    );
  }
}
