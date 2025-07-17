import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/thread_list/thread_list.dart';

class ThreadListFooter extends StatelessWidget {
  const ThreadListFooter(
    this.comment, {
    super.key,
  });

  final ThreadCommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppSpacing.spaceUnit * 2,
      ),
      child: ThreadTopLevelDivider(comment),
    );
  }
}
