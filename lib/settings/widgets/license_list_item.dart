import 'package:flutter/material.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:material_symbols_icons/symbols.dart';

class LicenseListItem extends StatelessWidget {
  const LicenseListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListTile(
      title: Text(l10n.settings_licenses),
      trailing: const Icon(Symbols.chevron_right),
      onTap: () {
        showLicensePage(
          useRootNavigator: true,
          context: context,
        );
      },
    );
  }
}
