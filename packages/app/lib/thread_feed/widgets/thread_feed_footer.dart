import 'package:app/thread_feed/thread_feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ThreadFeedFooter extends StatelessWidget {
  const ThreadFeedFooter(this.item, {super.key});

  final ThreadCommentModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppSpacing.spaceUnit * 2,
      ),
      child: ThreadFeedTopLevelDivider(item),
    );
  }
}
