import 'package:app/comment_draft_options/comment_draft_options.dart'
    hide CommentDraftModel;
import 'package:app/drafts/drafts.dart';
import 'package:app_ui/app_ui.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentDraftMoreButton extends StatelessWidget {
  const CommentDraftMoreButton(this.draft, {super.key});

  final CommentDraftModel draft;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const AppIcon(
        Symbols.more_vert_rounded,
        size: 20,
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
