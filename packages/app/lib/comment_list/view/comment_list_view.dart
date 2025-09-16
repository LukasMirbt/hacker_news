import 'package:app/comment_list/comment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentListView extends StatelessWidget {
  const CommentListView({super.key});

  @override
  Widget build(BuildContext context) {
    final isEmpty = context.select(
      (CommentListBloc bloc) => bloc.state.commentList.isEmpty,
    );

    if (isEmpty) return const CommentListEmptyBody();

    return const CommentListBody();
  }
}
