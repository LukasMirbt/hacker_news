import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/comment_draft_options/comment_draft_options.dart';
import 'package:material_symbols_icons/symbols.dart';

class CommentDraftItem extends StatelessWidget {
  const CommentDraftItem(this.draft, {super.key});

  final CommentDraft draft;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        draft.draft,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        draft.postTitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {},
      trailing: IconButton(
        icon: const Icon(
          Symbols.more_vert,
          size: 20,
          opticalSize: 20,
        ),
        onPressed: () {
          CommentDraftOptionsSheet.show(
            context: context,
            draft: draft,
          );
        },
      ),
    );
  }
}
