import 'package:app/comment_list/comment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class SelectedCommentListener extends StatelessWidget {
  const SelectedCommentListener({
    required this.listController,
    required this.child,
    this.selectedCommentModel = const SelectedCommentModel(),
    super.key,
  });

  final ListController listController;
  final Widget child;
  final SelectedCommentModel selectedCommentModel;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommentListBloc, CommentListState>(
      listenWhen: (previous, current) =>
          previous.commentList.selectedComment !=
          current.commentList.selectedComment,
      listener: (context, state) {
        final selectedIndex = state.commentList.selectedIndex;
        if (selectedIndex == null) return;

        listController.animateToItem(
          index: selectedIndex,
          scrollController: context.read<ScrollController>(),
          alignment: selectedCommentModel.alignment,
          curve: selectedCommentModel.curve,
          duration: selectedCommentModel.duration,
        );
      },
      child: child,
    );
  }
}
