import 'package:app/comment_list/comment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CommentListView extends StatelessWidget {
  const CommentListView({super.key});

  @override
  Widget build(BuildContext context) {
    final isPlaceholder = context.select(
      (CommentListBloc bloc) => bloc.state.commentList.isPlaceholder,
    );

    final isEmpty = context.select(
      (CommentListBloc bloc) => bloc.state.commentList.isEmpty,
    );

    if (isEmpty) return const CommentListEmptyBody();

    return SliverSkeletonizer(
      enabled: isPlaceholder,
      child: const CommentListBody(),
    );
  }
}
