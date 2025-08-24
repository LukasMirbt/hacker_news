import 'package:app/app_router/app_router.dart';
import 'package:app/drafts/drafts.dart';
import 'package:app/reply/reply.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReplyDraftItem extends StatelessWidget {
  const ReplyDraftItem(this.draft, {super.key});

  final ReplyDraftModel draft;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: _SingleLineText(draft.title),
      subtitle: _SingleLineText(draft.subtitle),
      trailing: ReplyDraftMoreButton(draft),
      contentPadding: const EdgeInsets.only(
        left: AppSpacing.xlg,
        right: 10,
      ),
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
