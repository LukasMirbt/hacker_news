import 'package:app/comment_list/comment_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentSeparator extends StatelessWidget {
  const CommentSeparator(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    final comment = context.watch<CommentModel>();

    final items = context
        .read<CommentListBloc>()
        .state
        .commentList
        .visibleItems;

    final nextComment = items[index + 1];

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
