import 'package:app/comment_list/comment_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class CommentSliverList extends StatelessWidget {
  const CommentSliverList({
    this.builder = const CommentListBuilder(),
    super.key,
  });

  final CommentListBuilder builder;

  @override
  Widget build(BuildContext context) {
    final visibleItems = context.select(
      (CommentListBloc bloc) => bloc.state.commentList.visibleItems,
    );

    return SuperSliverList.separated(
      itemCount: visibleItems.length,
      itemBuilder: builder.itemBuilder,
      separatorBuilder: builder.separatorBuilder,
    );
  }
}
