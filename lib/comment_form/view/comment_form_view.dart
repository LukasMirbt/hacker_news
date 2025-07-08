import 'package:flutter/material.dart';
import 'package:hacker_client/comment_form/comment_form.dart';
import 'package:hacker_client/l10n/l10n.dart';

class CommentFormView extends StatelessWidget {
  const CommentFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommentFormSuccessListener(
      child: CommentFormFailureListener(
        child: Scaffold(
          appBar: _AppBar(),
          body: CommentFormBody(),
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
