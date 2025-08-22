import 'package:app/app_router/app_router.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:app/drafts/drafts.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CommentDraftItem extends StatelessWidget {
  const CommentDraftItem(this.draft, {super.key});

  final CommentDraftModel draft;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: _SingleLineText(draft.title),
      subtitle: _SingleLineText(draft.subtitle),
      trailing: CommentDraftMoreButton(draft),
      contentPadding: const EdgeInsets.only(
        left: AppSpacing.xlg,
        right: 10,
      ),
      onTap: () {
        AppRouter.of(context)
          ..goRelative(
            PostRoute(
              postId: draft.postId,
            ),
          )
          ..goRelative(
            const CommentRoute(),
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
