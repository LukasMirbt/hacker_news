import 'package:app/l10n/l10n.dart';
import 'package:app/post/post.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class PostAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PostAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return const Hero(
      tag: 'post_app_bar',
      child: _AppBar(),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppBar(
      leading: const PostBackButton(),
      title: Text(l10n.post_title),
      actionsPadding: const EdgeInsets.only(right: AppSpacing.xs),
      actions: const [
        PostSearchButton(),
        PostOptionsButton(),
      ],
    );
  }
}
