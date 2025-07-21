import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_options/comment_options.dart';
import 'package:post_repository/post_repository.dart';

class CommentOptionsSheet extends StatelessWidget {
  const CommentOptionsSheet({
    required this.comment,
    super.key,
  });

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CommentOptionsBloc(comment: comment),
      child: const CommentOptionsView(),
    );
  }
}
