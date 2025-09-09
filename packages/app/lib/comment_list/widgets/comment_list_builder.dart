import 'package:app/comment_list/comment_list.dart';
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
    final nextComment = index + 1 < items.length ? items[index + 1] : null;

    final isStartOfThread = comment.isTopLevel;
    final isEndOfList = nextComment == null;
    final isEndOfThread = isEndOfList || nextComment.isTopLevel;

    return Provider.value(
      value: comment,
      child: Column(
        children: [
          if (isStartOfThread) const ThreadTopPadding(),
          const Comment(),
          if (comment.isExpanded) const CommentPadding(),
          if (isEndOfThread) const ThreadBottomPadding(),
          if (isEndOfThread) const Divider(height: 1),
          if (isEndOfList) const CommentListFooter(),
        ],
      ),
    );
  }
}
