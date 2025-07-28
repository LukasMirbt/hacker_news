import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/reply/reply.dart';

class ReplyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ReplyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isSubmittingEnabled = context.select(
      (ReplyBloc bloc) => bloc.state.isSubmittingEnabled,
    );

    final l10n = AppLocalizations.of(context);

    return AppBar(
      title: Text(l10n.reply_title),
      actions: [
        if (isSubmittingEnabled) const ReplySubmitButton(),
      ],
    );
  }
}
