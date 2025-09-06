import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class DraftEmptyBody extends StatelessWidget {
  const DraftEmptyBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppEmptyBody(
      icon: Symbols.drafts_rounded,
      title: l10n.drafts_emptyTitle,
      body: l10n.drafts_emptyBody,
    );
  }
}
