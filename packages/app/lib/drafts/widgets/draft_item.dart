import 'package:app/drafts/drafts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DraftItem extends StatelessWidget {
  const DraftItem({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final draft = context.select(
      (DraftBloc bloc) => bloc.state.drafts[index],
    );

    return switch (draft) {
      final CommentDraftModel draft => CommentDraftItem(draft),
      final ReplyDraftModel draft => ReplyDraftItem(draft),
    };
  }
}
