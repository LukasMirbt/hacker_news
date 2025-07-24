import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:hacker_client/l10n/l10n.dart';

class CommentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommentAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final l10n = AppLocalizations.of(context);

    return AppBar(
      title: Text(l10n.comment_title),
      centerTitle: false,
      shape: Border(
        bottom: BorderSide(
          color: colorScheme.outlineVariant,
        ),
      ),
      actionsPadding: const EdgeInsets.only(right: AppSpacing.sm),
      actions: const [
        CommentSubmitButton(),
      ],
    );
  }
}
