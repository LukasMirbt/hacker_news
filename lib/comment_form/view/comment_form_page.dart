import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_form/comment_form.dart';
import 'package:post_repository/post_repository.dart';

class CommentFormPage extends StatelessWidget {
  const CommentFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CommentFormBloc(
            postRepository: context.read<PostRepository>(),
          )..add(
            const CommentFormPostSubscriptionRequested(),
          ),
      child: const CommentFormView(),
    );
  }
}
