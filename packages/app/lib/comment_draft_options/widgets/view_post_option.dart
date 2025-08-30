import 'package:app/app_router/app_router.dart';
import 'package:app/comment_draft_options/comment_draft_options.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/post/post.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewPostOption extends StatelessWidget {
  const ViewPostOption({super.key});

  @override
  Widget build(BuildContext context) {
    final postTitle = context.select(
      (CommentDraftOptionsBloc bloc) => bloc.state.draft.postTitle,
    );

    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: const AppIcon(Symbols.article_shortcut_rounded),
      title: Text(l10n.commentDraftOptions_viewPost),
      subtitle: _SingleLineText(postTitle),
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

class _SingleLineText extends Text {
  const _SingleLineText(super.data)
    : super(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
}
