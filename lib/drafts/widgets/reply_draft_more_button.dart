import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/drafts/drafts.dart';
import 'package:hacker_client/reply_draft_options/reply_draft_options.dart'
    hide ReplyDraftModel;
import 'package:material_symbols_icons/symbols.dart';

class ReplyDraftMoreButton extends StatelessWidget {
  const ReplyDraftMoreButton(this.draft, {super.key});

  final ReplyDraftModel draft;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Symbols.more_vert,
        size: 20,
        opticalSize: 20,
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
