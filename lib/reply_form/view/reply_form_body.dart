import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply_form/reply_form.dart';

class ReplyFormBody extends StatelessWidget {
  const ReplyFormBody({super.key});

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
              padding: EdgeInsets.only(bottom: AppSpacing.md),
              child: _UserId(),
            ),
            ReplyFormHtml(
              padding: EdgeInsets.only(bottom: AppSpacing.lg),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.lg),
              child: ReplyFormTextField(),
            ),
            ReplyButton(),
          ],
        ),
      ),
    );
  }
}

class _UserId extends StatelessWidget {
  const _UserId();

  @override
  Widget build(BuildContext context) {
    final user = context.select(
      (ReplyFormBloc bloc) => bloc.state.replyForm.user,
    );

    final textTheme = ExtendedTextTheme.of(context);

    return Text(
      user,
      style: textTheme.labelLargeProminent,
    );
  }
}
