import 'package:app_ui/app_ui.dart' hide CommentHtml;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment/comment.dart';

class CommentEnabledBody extends StatelessWidget {
  const CommentEnabledBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.lg,
        horizontal: AppSpacing.xlg,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.lg),
              child: _Title(),
            ),
            CommentHtml(
              padding: EdgeInsets.only(bottom: AppSpacing.lg),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.lg),
              child: CommentTextField(),
            ),
          ],
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
      (CommentBloc bloc) => bloc.state.title,
    );

    final textTheme = TextTheme.of(context);

    return Text(
      title,
      style: textTheme.titleMedium,
    );
  }
}
