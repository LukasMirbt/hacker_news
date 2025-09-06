import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ThreadFeedEmptyBody extends StatelessWidget {
  const ThreadFeedEmptyBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppEmptyBody(
      icon: Symbols.forum_rounded,
      title: l10n.threadFeed_emptyTitle,
      body: l10n.threadFeed_emptyBody,
    );
  }
}
