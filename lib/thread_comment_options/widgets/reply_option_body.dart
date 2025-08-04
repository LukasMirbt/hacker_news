import 'package:flutter/material.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
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
      title: Text(l10n.threadCommentOptions_reply),
      onTap: () {
        Navigator.of(context).pop();
        AppRouter.of(context).goRelative(
          ReplyRoute(url: url),
        );
      },
    );
  }
}
