import 'package:app/app_router/app_router.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/post/post.dart';
import 'package:app/thread_comment_options/thread_comment_options.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewPostOptionBody extends StatelessWidget {
  const ViewPostOptionBody({
    required this.postId,
    super.key,
  });

  final String postId;

  @override
  Widget build(BuildContext context) {
    final onTitle = context.select(
      (ThreadCommentOptionsBloc bloc) => bloc.state.comment.onTitle,
    );

    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: const AppIcon(Symbols.article_shortcut_rounded),
      title: Text(l10n.threadCommentOptions_viewPost),
      subtitle: onTitle != null
          ? Text(
              onTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          : null,
      onTap: () {
        Navigator.of(context).pop();
        AppRouter.of(context).goRelative(
          PostRoute(postId: postId),
        );
      },
    );
  }
}
