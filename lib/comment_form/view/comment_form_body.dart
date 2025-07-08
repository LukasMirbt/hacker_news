import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_form/comment_form.dart';

class CommentFormBody extends StatelessWidget {
  const CommentFormBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSpacing.lg,
            horizontal: AppSpacing.xlg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: AppSpacing.lg),
                child: _Title(),
              ),
              CommentFormHtml(
                padding: EdgeInsets.only(bottom: AppSpacing.lg),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: AppSpacing.lg),
                child: CommentFormTextField(),
              ),
              AddCommentButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final title = context.select(
      (CommentFormBloc bloc) => bloc.state.post.header.title,
    );

    final textTheme = TextTheme.of(context);

    return Text(
      title,
      style: textTheme.titleMedium,
    );
  }
}
