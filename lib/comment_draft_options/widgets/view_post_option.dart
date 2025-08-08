import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/comment_draft_options/comment_draft_options.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:material_symbols_icons/symbols.dart';

class ViewPostOption extends StatelessWidget {
  const ViewPostOption({super.key});

  @override
  Widget build(BuildContext context) {
    final postTitle = context.select(
      (CommentDraftOptionsBloc bloc) => bloc.state.draft.postTitle,
    );

    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: const Icon(Symbols.article_shortcut),
      title: Text(l10n.draftOptions_viewPost),
      subtitle: Text(
        postTitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        final state = context.read<CommentDraftOptionsBloc>().state;
        final postId = state.draft.postId;
        Navigator.of(context).pop();
        AppRouter.of(context).goRelative(
          PostRoute(postId: postId),
        );
      },
    );
  }
}
