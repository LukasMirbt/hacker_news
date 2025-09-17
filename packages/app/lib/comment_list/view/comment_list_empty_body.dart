import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CommentListEmptyBody extends StatelessWidget {
  const CommentListEmptyBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return SliverFillRemaining(
      hasScrollBody: false,
      child: AppEmptyBody(
        icon: Symbols.mode_comment_rounded,
        title: l10n.commentList_emptyTitle,
        body: l10n.commentList_emptyBody,
      ),
    );
  }
}
