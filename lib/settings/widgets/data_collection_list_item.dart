import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/l10n/l10n.dart';

class DataCollectionListItem extends StatelessWidget {
  const DataCollectionListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListTile(
      title: Text(l10n.settings_dataCollection),
      trailing: const AppIcon(Symbols.chevron_right_rounded),
      onTap: () {
        AppRouter.of(context).go(
          const DataCollectionRoute(),
        );
      },
    );
  }
}
