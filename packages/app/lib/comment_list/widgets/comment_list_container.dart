import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentListContainer extends StatefulWidget {
  const CommentListContainer(this.itemBuilder, {super.key});

  final ItemBuilder itemBuilder;

  @override
  State<CommentListContainer> createState() => _CommentListContainerState();
}

class _CommentListContainerState extends State<CommentListContainer> {
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
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        listController: _listController,
        itemCount: itemCount,
        itemBuilder: widget.itemBuilder,
      ),
    );
  }
}
