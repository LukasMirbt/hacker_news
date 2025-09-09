import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThreadTopPadding extends StatelessWidget {
  const ThreadTopPadding({super.key});

  @override
  Widget build(BuildContext context) {
    final index = context.watch<int>();

    final isStartOfThread = context.select(
      (CommentListBloc bloc) => bloc.state.commentList.isStartOfThread(index),
    );

    if (!isStartOfThread) return const SizedBox.shrink();

    return const SizedBox(
      width: double.infinity,
      height: AppSpacing.xs,
    );
  }
}
