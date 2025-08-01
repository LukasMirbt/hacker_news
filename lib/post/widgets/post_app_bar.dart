import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/post/post.dart';

class PostAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PostAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppBar(
      leading: const PostBackButton(),
      title: Text(l10n.post_title),
      actionsPadding: const EdgeInsets.only(right: AppSpacing.xs),
      actions: const [
        PostOptionsButton(),
      ],
    );
  }
}
