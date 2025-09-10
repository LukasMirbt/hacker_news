import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThreadBottomPadding extends StatelessWidget {
  const ThreadBottomPadding({super.key});

  @override
  Widget build(BuildContext context) {
    final index = context.watch<int>();

    final isEndOfThread = context.select(
      (AppCommentListData data) => data.isEndOfThread(index),
    );

    if (!isEndOfThread) return const SizedBox.shrink();

    return const ThreadBottomPaddingBody();
  }
}

class ThreadBottomPaddingBody extends StatelessWidget {
  const ThreadBottomPaddingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final threadBottomPadding = context.select(
      (AppCommentModel comment) => comment.threadBottomPadding,
    );

    return SizedBox(
      width: double.infinity,
      height: threadBottomPadding,
    );
  }
}
