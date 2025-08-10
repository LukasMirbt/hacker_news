import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/drafts/drafts.dart';

class ReplyDraftItem extends StatelessWidget {
  const ReplyDraftItem(this.draft, {super.key});

  final ReplyDraftModel draft;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: _SingleLineText(draft.title),
      subtitle: _SingleLineText(draft.subtitle),
      trailing: ReplyDraftMoreButton(draft),
      onTap: () {
        context.read<AppRouter>().goRelative(
          ReplyRoute(url: draft.url),
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
