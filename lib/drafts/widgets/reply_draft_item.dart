import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/reply_draft_options/reply_draft_options.dart';
import 'package:material_symbols_icons/symbols.dart';

class ReplyDraftItem extends StatelessWidget {
  const ReplyDraftItem(this.draft, {super.key});

  final ReplyDraft draft;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        draft.draft,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        '"${draft.parentHtmlText}"',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        context.read<AppRouter>().goRelative(
          ReplyRoute(url: draft.url),
        );
      },
      trailing: IconButton(
        icon: const Icon(
          Symbols.more_vert,
          size: 20,
          opticalSize: 20,
        ),
        onPressed: () {
          ReplyDraftOptionsSheet.show(
            context: context,
            draft: draft,
          );
        },
      ),
    );
  }
}
