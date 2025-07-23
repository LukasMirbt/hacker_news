import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/thread_item_options/thread_item_options.dart';
import 'package:material_symbols_icons/symbols.dart';

class ViewPostOptionBody extends StatelessWidget {
  const ViewPostOptionBody({
    required this.postId,
    super.key,
  });

  final String postId;

  @override
  Widget build(BuildContext context) {
    final onTitle = context.select(
      (ThreadItemOptionsBloc bloc) => bloc.state.item.onTitle,
    );

    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: const Icon(Symbols.article_shortcut),
      title: Text(l10n.threadItemOptions_viewPost),
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
