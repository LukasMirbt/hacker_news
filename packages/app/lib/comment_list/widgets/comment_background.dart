import 'package:app/comment_list/comment_list.dart';
import 'package:app/post_search/post_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBackground extends StatelessWidget {
  const CommentBackground({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final comment = context.watch<CommentModel>();

    final isSelected = context.select(
      (PostSearchBloc bloc) => bloc.state.isSelected(
        comment.toRepository(),
      ),
    );

    return Material(
      color: isSelected ? Colors.yellow : Colors.transparent,
      child: child,
    );
  }
}
