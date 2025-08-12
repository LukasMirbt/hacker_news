import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/l10n/l10n.dart';

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
      leading: const AppIcon(Symbols.reply_rounded),
      title: Text(l10n.commentOptions_reply),
      onTap: () {
        Navigator.of(context).pop();
        AppRouter.of(context).goRelative(
          ReplyRoute(url: url),
        );
      },
    );
  }
}
