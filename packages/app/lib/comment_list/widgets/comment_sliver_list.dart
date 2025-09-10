import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class CommentSliverList extends StatefulWidget {
  const CommentSliverList({super.key});

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

    final selectedIndex = context.select(
      (CommentListBloc bloc) => bloc.state.commentList.selectedIndex,
    );

    return SelectedCommentListener(
      listController: _listController,
      child: AppCommentList(
        data: AppCommentListData(
          listController: _listController,
          selectedIndex: selectedIndex,
          items: visibleItems,
          commentBuilder: (_, index) {
            final comment = visibleItems[index];
            if (comment.htmlText.contains('Nice.')) {
              Clipboard.setData(ClipboardData(text: comment.htmlText));
              print(comment.htmlText);
            }
            return Comment(comment);
          },
        ),
      ),
    );
  }
}
