import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentListBuilder {
  const CommentListBuilder();

  Widget itemBuilder(BuildContext context, int index) {
    return Builder(
      builder: (context) {
        final comment = context.select(
          (CommentListBloc bloc) => bloc.state.commentList.visibleItems[index],
        );

        // TODO: Keep refactoring
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
      },
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return Builder(
      builder: (context) {
        final comment = context.select(
          (CommentListBloc bloc) => bloc.state.commentList.visibleItems[index],
        );

        return Provider.value(
          value: comment,
          child: _CommentSeparator(index),
        );
      },
    );
  }
}

class _CommentSeparator extends StatelessWidget {
  const _CommentSeparator(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    final comment = context.watch<CommentModel>();

    final nextComment = context.select(
      (CommentListBloc bloc) => bloc.state.commentList.visibleItems[index + 1],
    );

    if (nextComment.isTopLevel) {
      return const Column(
        children: [
          ThreadFooter(),
          Divider(height: 1),
        ],
      );
    }

    if (!comment.isExpanded) return const SizedBox.shrink();

    return const IndentedCommentDivider();
  }
}
