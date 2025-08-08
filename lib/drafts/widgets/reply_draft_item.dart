import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/drafts/drafts.dart';
import 'package:hacker_client/reply_draft_options/reply_draft_options.dart'
    hide ReplyDraftModel;
import 'package:material_symbols_icons/symbols.dart';

class ReplyDraftItem extends StatelessWidget {
  const ReplyDraftItem(this.draft, {super.key});

  final ReplyDraftModel draft;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        draft.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        draft.subtitle,
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
            draft: draft.toRepository(),
          );
        },
      ),
    );
  }
}
