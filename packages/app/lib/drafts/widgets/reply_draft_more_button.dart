import 'package:app/drafts/drafts.dart';
import 'package:app/reply_draft_options/reply_draft_options.dart'
    hide ReplyDraftModel;
import 'package:app_ui/app_ui.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReplyDraftMoreButton extends StatelessWidget {
  const ReplyDraftMoreButton(this.draft, {super.key});

  final ReplyDraftModel draft;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const AppIcon(
        Symbols.more_vert_rounded,
        size: 20,
      ),
      onPressed: () {
        ReplyDraftOptionsSheet.show(
          context: context,
          draft: draft.toRepository(),
          draftRepository: context.read<DraftRepository>(),
        );
      },
    );
  }
}
