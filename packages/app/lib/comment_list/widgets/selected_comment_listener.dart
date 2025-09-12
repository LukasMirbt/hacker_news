import 'package:app/comment_list/comment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class SelectedCommentListener extends StatelessWidget {
  const SelectedCommentListener({
    required this.listController,
    required this.child,
    super.key,
  });

  final ListController listController;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommentListBloc, CommentListState>(
      listenWhen: (previous, current) =>
          previous.commentList.selectedComment !=
          current.commentList.selectedComment,
      listener: (context, state) {
        final selectedComment = state.commentList.selectedComment;
        if (selectedComment == null) return;

        listController.animateToItem(
          index: selectedComment.index,
          scrollController: context.read<ScrollController>(),
          alignment: selectedComment.alignment,
          curve: selectedComment.curve,
          duration: selectedComment.duration,
        );
      },
      child: child,
    );
  }
}
