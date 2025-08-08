import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/delete_draft/delete_draft.dart';
import 'package:hacker_client/l10n/l10n.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final l10n = AppLocalizations.of(context);

    return TextButton(
      onPressed: () {
        context.read<DeleteDraftBloc>().add(
          const DeleteDraftConfirmed(),
        );
        Navigator.of(context).pop();
      },
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.error,
      ),
      child: Text(
        l10n.deleteDraft_confirmAction,
      ),
    );
  }
}
