import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class CommentSliverList extends StatelessWidget {
  const CommentSliverList({super.key});

  Widget listBuilder(BuildContext context, ItemBuilder itemBuilder) {
    return CommentList(itemBuilder);
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
        listBuilder: listBuilder,
        commentBuilder: commentBuilder,
      ),
    );
  }
}

class CommentList extends StatefulWidget {
  const CommentList(this.itemBuilder, {super.key});

  final Widget Function(BuildContext, int) itemBuilder;

  @override
  State<CommentList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  late final ListController _listController;

  @override
  void initState() {
    super.initState();
    _listController = ListController();
  }

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemCount = context.select(
      (CommentListBloc bloc) => bloc.state.commentList.visibleItems.length,
    );

    return SelectedCommentListener(
      listController: _listController,
      child: SuperSliverList.builder(
        listController: _listController,
        itemCount: itemCount,
        itemBuilder: widget.itemBuilder,
      ),
    );
  }
}
