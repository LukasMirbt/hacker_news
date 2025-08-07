import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/draft_options/draft_options.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:material_symbols_icons/symbols.dart';

class DeleteOption extends StatelessWidget {
  const DeleteOption({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context);

    return ListTile(
      textColor: colorScheme.error,
      iconColor: colorScheme.error,
      leading: const Icon(Symbols.delete),
      title: Text(l10n.draftOptions_delete),
      onTap: () {
        Navigator.of(context).pop();
        DeleteConfirmationDialog.show(
          context: context,
          bloc: context.read<DraftOptionsBloc>(),
        );
      },
    );
  }
}
