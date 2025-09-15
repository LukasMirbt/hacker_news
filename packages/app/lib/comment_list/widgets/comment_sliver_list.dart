import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentSliverList extends StatelessWidget {
  const CommentSliverList({super.key});

  Widget containerBuilder(BuildContext context, ItemBuilder itemBuilder) {
    return CommentListContainer(itemBuilder);
  }

  Widget commentBuilder(BuildContext context, int index) {
    return Comment(index);
  }

  @override
  Widget build(BuildContext context) {
    final visibleItems = context.select(
      (CommentListBloc bloc) => bloc.state.commentList.visibleItems,
    );

    final selectedIndex = context.select(
      (CommentListBloc bloc) => bloc.state.commentList.selectedIndex,
    );

    return AppCommentList(
      data: AppCommentListData(
        selectedIndex: selectedIndex,
        items: visibleItems,
        containerBuilder: containerBuilder,
        commentBuilder: commentBuilder,
      ),
    );
  }
}
