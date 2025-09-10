import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentListFooter extends StatelessWidget {
  const CommentListFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final index = context.watch<int>();

    final isEndOfList = context.select(
      (AppCommentListData data) => data.isEndOfList(index),
    );

    if (!isEndOfList) return const SizedBox.shrink();

    return const CommentListFooterBody();
  }
}

class CommentListFooterBody extends StatelessWidget {
  const CommentListFooterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: AppSpacing.lg),
        SafeArea(child: SizedBox.shrink()),
      ],
    );
  }
}
