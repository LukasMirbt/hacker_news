import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment/comment.dart';

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
    final isFailure = context.select(
      (CommentBloc bloc) => bloc.state.form.fetchStatus.isFailure,
    );

    final isLoading = context.select(
      (CommentBloc bloc) => bloc.state.form.fetchStatus.isLoading,
    );

    final isCommentingEnabled = context.select(
      (CommentBloc bloc) => bloc.state.form.isCommentingEnabled,
    );

    if (isFailure) return const ErrorText();
    if (isLoading) return const Spinner();
    if (isCommentingEnabled) return const CommentEnabledBody();
    return const CommentDisabledBody();
  }
}
