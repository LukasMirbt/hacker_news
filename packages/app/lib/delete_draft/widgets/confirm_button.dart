import 'package:app/delete_draft/delete_draft.dart';
import 'package:app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return TextButton(
      onPressed: () {
        context.read<DeleteDraftBloc>().add(
          const DeleteDraftConfirmed(),
        );
        Navigator.of(context).pop();
      },
      child: Text(l10n.deleteDraft_confirmAction),
    );
  }
}
