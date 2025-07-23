import 'package:flutter/material.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:hacker_client/l10n/l10n.dart';

class CommentView extends StatelessWidget {
  const CommentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommentSuccessListener(
      child: CommentFailureListener(
        child: Scaffold(
          appBar: _AppBar(),
          body: CommentBody(),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppBar(
      title: Text(l10n.commentForm_title),
    );
  }
}
