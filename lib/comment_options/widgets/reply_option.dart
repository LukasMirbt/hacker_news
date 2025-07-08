import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/comment_options/comment_options.dart';
import 'package:hacker_client/l10n/l10n.dart';

class ReplyOption extends StatelessWidget {
  const ReplyOption({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: Assets.images.replyIcon.image(
        color: colorScheme.onSurfaceVariant,
        width: 24,
        height: 24,
      ),
      title: Text(l10n.commentOptions_reply),
      onTap: () {
        final state = context.read<CommentOptionsBloc>().state;
        final postId = state.postId;
        final commentId = state.comment.id;
        ReplyFormRoute(
          postId: postId,
          commentId: commentId,
        ).go(context);
      },
    );
  }
}
