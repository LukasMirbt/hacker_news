import 'package:app/comment_list/comment_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class CommentSliverList extends StatefulWidget {
  const CommentSliverList({
    this.builder = const CommentListBuilder(),
    super.key,
  });

  final CommentListBuilder builder;

  @override
  State<CommentSliverList> createState() => _CommentSliverListState();
}

class _CommentSliverListState extends State<CommentSliverList> {
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
    final visibleItems = context.select(
      (CommentListBloc bloc) => bloc.state.commentList.visibleItems,
    );

    return SelectedCommentListener(
      listController: _listController,
      child: SuperSliverList.separated(
        listController: _listController,
        itemCount: visibleItems.length,
        itemBuilder: widget.builder.itemBuilder,
        separatorBuilder: widget.builder.separatorBuilder,
      ),
    );
  }
}
