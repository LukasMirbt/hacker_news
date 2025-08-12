import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/drafts/drafts.dart';

class DraftBuilder {
  const DraftBuilder();

  Widget itemBuilder(BuildContext context, int index) {
    final state = context.read<DraftBloc>().state;
    final draft = state.drafts[index];

    return switch (draft) {
      final CommentDraftModel draft => CommentDraftItem(draft),
      final ReplyDraftModel draft => ReplyDraftItem(draft),
    };
  }
}
