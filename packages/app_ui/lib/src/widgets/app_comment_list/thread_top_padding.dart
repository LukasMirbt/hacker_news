import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThreadTopPadding extends StatelessWidget {
  const ThreadTopPadding({super.key});

  @override
  Widget build(BuildContext context) {
    final index = context.watch<int>();

    final isStartOfThread = context.select(
      (AppCommentListData data) => data.isStartOfThread(index),
    );

    if (!isStartOfThread) return const SizedBox.shrink();

    return const ThreadTopPaddingBody();
  }
}

class ThreadTopPaddingBody extends StatelessWidget {
  const ThreadTopPaddingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: AppSpacing.xs,
    );
  }
}
