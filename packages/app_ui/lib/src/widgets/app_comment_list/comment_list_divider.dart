import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentListDivider extends StatelessWidget {
  const CommentListDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final index = context.watch<int>();

    final isEndOfThread = context.select(
      (AppCommentListData data) => data.isEndOfThread(index),
    );

    if (!isEndOfThread) return const SizedBox.shrink();

    return const CommentListDividerBody();
  }
}

class CommentListDividerBody extends StatelessWidget {
  const CommentListDividerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1);
  }
}
