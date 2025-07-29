import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';

class ThreadFeedTopLevelDivider extends StatelessWidget {
  const ThreadFeedTopLevelDivider(this.item, {super.key});

  final ThreadCommentModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: item.isExpanded ? AppSpacing.lg : AppSpacing.xs,
        bottom: AppSpacing.xs,
      ),
      child: const Divider(height: 1),
    );
  }
}
