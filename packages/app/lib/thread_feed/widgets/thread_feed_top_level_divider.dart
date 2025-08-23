import 'package:app/thread_feed/thread_feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ThreadFeedTopLevelDivider extends StatelessWidget {
  const ThreadFeedTopLevelDivider(this.comment, {super.key});

  final ThreadCommentModel comment;

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
