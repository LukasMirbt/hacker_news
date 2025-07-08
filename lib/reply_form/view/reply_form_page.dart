import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply_form/reply_form.dart';
import 'package:post_repository/post_repository.dart';

class ReplyFormPage extends StatelessWidget {
  const ReplyFormPage({
    required this.commentId,
    super.key,
  });

  final String commentId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ReplyFormBloc(
            commentId: commentId,
            postRepository: context.read<PostRepository>(),
          )..add(
            const ReplyFormStarted(),
          ),
      child: const ReplyFormView(),
    );
  }
}
