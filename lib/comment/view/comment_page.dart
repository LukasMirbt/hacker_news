import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:post_repository/post_repository.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({
    required this.form,
    super.key,
  });

  final CommentForm form;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CommentBloc(
            form: form,
            postRepository: context.read<PostRepository>(),
          )..add(
            const CommentPostSubscriptionRequested(),
          ),
      child: const CommentView(),
    );
  }
}
