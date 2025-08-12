import 'package:app_ui/app_ui.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/delete_draft/delete_draft.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/reply_draft_options/reply_draft_options.dart';

class DeleteOption extends StatelessWidget {
  const DeleteOption({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);

    return ListTile(
      textColor: colorScheme.error,
      iconColor: colorScheme.error,
      leading: const AppIcon(Symbols.delete_rounded),
      title: Text(l10n.replyDraftOptions_delete),
      onTap: () {
        final state = context.read<ReplyDraftOptionsBloc>().state;
        Navigator.of(context).pop();
        DeleteDraftDialog.show(
          context: context,
          draft: state.draft.toRepository(),
          draftRepository: context.read<DraftRepository>(),
        );
      },
    );
  }
}
