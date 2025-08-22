import 'package:app/delete_draft/delete_draft.dart';
import 'package:app/l10n/l10n.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteDraftDialog extends StatelessWidget {
  const DeleteDraftDialog({super.key});

  static void show({
    required BuildContext context,
    required Draft draft,
    required DraftRepository draftRepository,
  }) {
    showDialog<void>(
      context: context,
      builder: (_) => BlocProvider(
        lazy: false,
        create: (_) => DeleteDraftBloc(
          draft: draft,
          draftRepository: draftRepository,
        ),
        child: const DeleteDraftDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AlertDialog(
      title: Text(l10n.deleteDraft_title),
      content: Text(l10n.deleteDraft_content),
      actions: const [
        CancelButton(),
        ConfirmButton(),
      ],
    );
  }
}
