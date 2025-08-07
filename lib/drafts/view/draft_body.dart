import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/drafts/drafts.dart';
import 'package:hacker_client/drafts/widgets/reply_draft_item.dart';

class DraftBody extends StatelessWidget {
  const DraftBody({super.key});

  @override
  Widget build(BuildContext context) {
    final drafts = context.select(
      (DraftBloc bloc) => bloc.state.drafts,
    );

    return Column(
      children: [
        for (final draft in drafts)
          switch (draft) {
            final CommentDraft draft => CommentDraftItem(draft),
            final ReplyDraft draft => ReplyDraftItem(draft),
          },
      ],
    );
  }
}
