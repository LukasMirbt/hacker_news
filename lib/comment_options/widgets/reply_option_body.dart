import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/comment_options/comment_options.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:material_symbols_icons/symbols.dart';

class ReplyOptionBody extends StatelessWidget {
  const ReplyOptionBody({
    required this.url,
    super.key,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: const Icon(Symbols.reply),
      title: Text(l10n.commentOptions_reply),
      onTap: () {
        final state = context.read<CommentOptionsBloc>().state;
        Navigator.of(context).pop();
        ReplyRoute(
          url: url,
          $extra: null /* state.comment.toRepository() */,
        ).goRelative(context);
      },
    );
  }
}
