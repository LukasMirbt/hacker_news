import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/reply/reply.dart';

class ReplyView extends StatelessWidget {
  const ReplyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ReplySuccessListener(
      child: ReplyFailureListener(
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
      (ReplyBloc bloc) => bloc.state.fetchStatus.isLoading,
    );

    final isFailure = context.select(
      (ReplyBloc bloc) => bloc.state.fetchStatus.isFailure,
    );

    if (isFailure) return const ErrorText();
    if (isLoading) return const Spinner();
    return const ReplyBody();
  }
}
