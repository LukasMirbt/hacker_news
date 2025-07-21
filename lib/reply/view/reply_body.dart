import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply/reply.dart';

class ReplyBody extends StatelessWidget {
  const ReplyBody({super.key});

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
            ReplyHtml(
              padding: EdgeInsets.only(bottom: AppSpacing.lg),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.lg),
              child: ReplyTextField(),
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
      (ReplyBloc bloc) => bloc.state.form.user,
    );

    final textTheme = ExtendedTextTheme.of(context);

    return Text(
      user,
      style: textTheme.labelLargeProminent,
    );
  }
}
