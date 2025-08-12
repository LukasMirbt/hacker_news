import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/l10n/l10n.dart';

class LicenseListItem extends StatelessWidget {
  const LicenseListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListTile(
      title: Text(l10n.settings_licenses),
      trailing: const AppIcon(Symbols.chevron_right_rounded),
      onTap: () {
        showLicensePage(
          useRootNavigator: true,
          context: context,
        );
      },
    );
  }
}
