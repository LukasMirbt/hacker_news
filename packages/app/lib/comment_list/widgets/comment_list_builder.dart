import 'package:app/comment_list/comment_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentListBuilder {
  const CommentListBuilder();

  Widget itemBuilder(BuildContext context, int index) {
    return Provider.value(
      value: index,
      child: const _CommentListItem(),
    );
  }
}

class _CommentListItem extends StatelessWidget {
  const _CommentListItem();

  @override
  Widget build(BuildContext context) {
    final index = context.watch<int>();

    final comment = context.select(
      (CommentListBloc bloc) =>
          bloc.state.commentList.visibleItems.elementAtOrNull(index),
    );

    if (comment == null) return const SizedBox.shrink();

    return Provider.value(
      value: comment,
      child: const _Item(),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CommentListItem(),
        CommentListDivider(),
        CommentListFooter(),
      ],
    );
  }
}
