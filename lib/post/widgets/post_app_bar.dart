import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/post/post.dart';

// This is now a simple StatelessWidget that returns a regular AppBar.
class PostAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PostAppBar({super.key});

  // The fixed height of the app bar.
  @override
  Size get preferredSize => const Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final l10n = AppLocalizations.of(context);

    // No more AnimatedContainer or context.watch.
    return AppBar(
      leading: const PostBackButton(),
      title: Text(l10n.post_title),
      centerTitle: false,
      shape: Border(
        bottom: BorderSide(
          color: colorScheme.outlineVariant,
        ),
      ),
      actionsPadding: const EdgeInsets.only(
        right: AppSpacing.xs,
      ),
      actions: const [
        PostOptionsButton(),
      ],
    );
  }
}
