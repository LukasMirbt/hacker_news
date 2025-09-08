import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentListBuilder {
  const CommentListBuilder();

  Widget itemBuilder(BuildContext context, int index) {
    final state = context.read<CommentListBloc>().state;
    final items = state.commentList.visibleItems;
    final comment = items[index];
    final isLast = index == items.length - 1;

    return CommentBackground(
      comment: comment,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: comment.indent * AppSpacing.md,
            ),
            child: Comment(comment),
          ),
          if (isLast) CommentListFooter(comment),
        ],
      ),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    final state = context.read<CommentListBloc>().state;
    final items = state.commentList.visibleItems;
    final comment = items[index];
    final nextComment = items[index + 1];

    if (nextComment.isTopLevel) return CommentTopLevelDivider(comment);
    if (!comment.isExpanded) return const SizedBox.shrink();

    return const SizedBox(height: AppSpacing.sm);
  }
}
