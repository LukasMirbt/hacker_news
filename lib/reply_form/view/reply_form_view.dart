import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/reply_form/reply_form.dart';

class ReplyFormView extends StatelessWidget {
  const ReplyFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReplyFormSuccessListener(
      child: ReplyFormFailureListener(
        child: Scaffold(
          appBar: _AppBar(),
          body: _Body(),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppBar(
      title: Text(l10n.replyForm_title),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (ReplyFormBloc bloc) => bloc.state.fetchStatus.isLoading,
    );

    final isFailure = context.select(
      (ReplyFormBloc bloc) => bloc.state.fetchStatus.isFailure,
    );

    if (isFailure) return const ErrorText();
    if (isLoading) return const Spinner();
    return const ReplyFormBody();
  }
}
