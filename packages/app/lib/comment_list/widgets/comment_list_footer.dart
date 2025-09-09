import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentListFooter extends StatelessWidget {
  const CommentListFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final index = context.watch<int>();

    final isEndOfList = context.select(
      (CommentListBloc bloc) => bloc.state.commentList.isEndOfList(index),
    );

    if (!isEndOfList) return const SizedBox.shrink();

    return const Column(
      children: [
        SizedBox(height: AppSpacing.lg),
        SafeArea(child: SizedBox.shrink()),
      ],
    );
  }
}
