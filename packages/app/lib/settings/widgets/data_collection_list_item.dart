import 'package:app/app_router/app_router.dart';
import 'package:app/data_collection/data_collection.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class DataCollectionListItem extends StatelessWidget {
  const DataCollectionListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: const AppIcon(Symbols.analytics_rounded),
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
