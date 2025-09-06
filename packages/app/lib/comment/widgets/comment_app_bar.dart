import 'package:app/comment/comment.dart';
import 'package:app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommentAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isSubmittingEnabled = context.select(
      (CommentBloc bloc) => bloc.state.isSubmittingEnabled,
    );

    final l10n = AppLocalizations.of(context);

    return AppBar(
      title: Text(l10n.comment_title),
      actions: [
        if (isSubmittingEnabled) const CommentSubmitButton(),
      ],
    );
  }
}
