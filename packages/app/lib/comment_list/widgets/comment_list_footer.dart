import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentListFooter extends StatelessWidget {
  const CommentListFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final lastComment = context.select(
      (CommentListBloc bloc) => bloc.state.commentList.visibleItems.lastOrNull,
    );

    if (lastComment == null) return const SizedBox.shrink();

    return Provider.value(
      value: lastComment,
      child: const Column(
        children: [
          ThreadFooter(),
          Divider(height: 1),
          SizedBox(height: AppSpacing.lg),
          SafeArea(child: SizedBox.shrink()),
        ],
      ),
    );
  }
}
