import 'package:app_ui/app_ui.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply_draft_options/reply_draft_options.dart';

class ReplyDraftOptionsSheet extends StatelessWidget {
  const ReplyDraftOptionsSheet({super.key});

  static void show({
    required BuildContext context,
    required ReplyDraft draft,
    required DraftRepository draftRepository,
  }) {
    showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      showDragHandle: true,
      builder: (_) => RepositoryProvider.value(
        value: draftRepository,
        child: BlocProvider(
          create: (_) => ReplyDraftOptionsBloc(draft: draft),
          child: const ReplyDraftOptionsSheet(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const AppBottomSheet(
      children: [
        DeleteOption(),
      ],
    );
  }
}
