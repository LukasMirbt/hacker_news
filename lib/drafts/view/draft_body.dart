import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/drafts/drafts.dart';

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
            final CommentDraft draft => ListTile(
              title: Text(
                draft.draft,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                'On: ${draft.postTitle}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {},
            ),
            final ReplyDraft draft => ListTile(
              title: Text(
                draft.draft,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                'On: ${draft.parentHtmlText}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {},
            ),
          },
      ],
    );
  }
}
