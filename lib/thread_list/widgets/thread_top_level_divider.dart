import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/thread_list/thread_list.dart';

class ThreadTopLevelDivider extends StatelessWidget {
  const ThreadTopLevelDivider(this.item, {super.key});

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
