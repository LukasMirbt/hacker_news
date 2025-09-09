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
          previous.selectedComment != current.selectedComment,
      listener: (context, state) {
        final selectedComment = state.selectedComment;
        if (selectedComment == null) return;

        final visibleItems = state.commentList.visibleItems;

        final index = visibleItems.indexWhere(
          (comment) => comment.id == selectedComment.comment.id,
        );

        listController.animateToItem(
          index: index,
          scrollController: context.read<ScrollController>(),
          alignment: 0,
          duration: (estimatedDistance) => const Duration(milliseconds: 800),
          curve: (estimatedDistance) => Curves.easeInOut,
        );
      },
      child: child,
    );
  }
}
