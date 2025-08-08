import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:post_repository/post_repository.dart';

class CommentView extends StatelessWidget {
  const CommentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommentSuccessListener(
      child: CommentFailureListener(
        child: Scaffold(
          appBar: CommentAppBar(),
          body: _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final fetchStatus = context.select(
      (CommentBloc bloc) => bloc.state.fetchStatus,
    );

    return switch (fetchStatus) {
      FetchStatus.loading => const Spinner(),
      FetchStatus.success => const CommentBody(),
      FetchStatus.failure => const ErrorText(),
    };
  }
}
