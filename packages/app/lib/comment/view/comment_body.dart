import 'package:app/comment/comment.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBody extends StatelessWidget {
  const CommentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.lg,
        horizontal: AppSpacing.xlg,
      ),
      child: SafeArea(
        child: _Section(),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section();

  @override
  Widget build(BuildContext context) {
    final isCommentingEnabled = context.select(
      (CommentBloc bloc) => bloc.state.form.isCommentingEnabled,
    );

    if (isCommentingEnabled) return const CommentEnabledSection();

    return const CommentDisabledSection();
  }
}
