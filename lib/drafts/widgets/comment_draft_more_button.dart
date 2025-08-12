import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_draft_options/comment_draft_options.dart'
    hide CommentDraftModel;
import 'package:hacker_client/drafts/drafts.dart';
import 'package:material_symbols_icons/symbols.dart';

class CommentDraftMoreButton extends StatelessWidget {
  const CommentDraftMoreButton(this.draft, {super.key});

  final CommentDraftModel draft;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Symbols.more_vert,
        size: 20,
        opticalSize: 20,
      ),
      onPressed: () {
        CommentDraftOptionsSheet.show(
          context: context,
          draft: draft.toRepository(),
          draftRepository: context.read<DraftRepository>(),
        );
      },
    );
  }
}
