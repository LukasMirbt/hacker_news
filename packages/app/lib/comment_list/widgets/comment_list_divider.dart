import 'package:app/comment_list/comment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentListDivider extends StatelessWidget {
  const CommentListDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final index = context.watch<int>();

    final isEndOfThread = context.select(
      (CommentListBloc bloc) => bloc.state.commentList.isEndOfThread(index),
    );

    if (!isEndOfThread) return const SizedBox.shrink();

    return const Divider(height: 1);
  }
}
