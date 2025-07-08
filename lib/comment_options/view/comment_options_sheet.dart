import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_options/comment_options.dart';
import 'package:post_repository/post_repository.dart';

class CommentOptionsSheet extends StatelessWidget {
  const CommentOptionsSheet({
    required this.commentId,
    super.key,
  });

  final String commentId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => CommentOptionsBloc(
        commentId: commentId,
        postRepository: context.read<PostRepository>(),
      ),
      child: const CommentOptionsView(),
    );
  }
}
