import 'package:app/comment_draft_options/comment_draft_options.dart';
import 'package:app/delete_draft/delete_draft.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:draft_repository/draft_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      title: Text(l10n.commentDraftOptions_delete),
      onTap: () {
        final state = context.read<CommentDraftOptionsBloc>().state;
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
