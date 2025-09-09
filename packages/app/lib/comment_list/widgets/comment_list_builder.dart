import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentListBuilder {
  const CommentListBuilder();

  Widget itemBuilder(BuildContext context, int index) {
    final items = context
        .read<CommentListBloc>()
        .state
        .commentList
        .visibleItems;
    final comment = items[index];

    return Provider.value(
      value: comment,
      child: CommentIndent(
        child: CommentBackground(
          child: Column(
            children: [
              if (comment.isTopLevel) const SizedBox(height: AppSpacing.xs),
              const Comment(),
            ],
          ),
        ),
      ),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    final items = context
        .read<CommentListBloc>()
        .state
        .commentList
        .visibleItems;

    final comment = items[index];

    return Provider.value(
      value: comment,
      child: CommentSeparator(index),
    );
  }
}
