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
            _UserId(),
            SizedBox(height: AppSpacing.sm),
            ReplyHtml(),
            SizedBox(height: AppSpacing.lg),
            ReplyTextField(),
            SizedBox(height: AppSpacing.lg),
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
      (ReplyBloc bloc) => bloc.state.form.hnuser.id,
    );

    final textTheme = ExtendedTextTheme.of(context);

    return Text(
      user,
      style: textTheme.labelLargeProminent,
    );
  }
}
