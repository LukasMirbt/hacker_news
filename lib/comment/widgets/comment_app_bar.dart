import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:hacker_client/l10n/l10n.dart';

class CommentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommentAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isCommentingEnabled = context.select(
      (CommentBloc bloc) => bloc.state.form.isCommentingEnabled,
    );

    final isFailure = context.select(
      (CommentBloc bloc) => bloc.state.form.fetchStatus.isFailure,
    );

    final isLoading = context.select(
      (CommentBloc bloc) => bloc.state.form.fetchStatus.isLoading,
    );

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
      actions: [
        if (isCommentingEnabled && !isLoading && !isFailure)
          const CommentSubmitButton(),
      ],
    );
  }
}
