import 'package:app_ui/app_ui.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_draft_options/comment_draft_options.dart';

class CommentDraftOptionsSheet extends StatelessWidget {
  const CommentDraftOptionsSheet({super.key});

  static void show({
    required BuildContext context,
    required CommentDraft draft,
  }) {
    showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      showDragHandle: true,
      builder: (_) => BlocProvider(
        create: (_) => CommentDraftOptionsBloc(draft: draft),
        child: const CommentDraftOptionsSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const AppBottomSheet(
      children: [
        ViewPostOption(),
        DeleteOption(),
      ],
    );
  }
}
