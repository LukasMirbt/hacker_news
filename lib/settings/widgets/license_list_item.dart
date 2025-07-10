import 'package:flutter/material.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/l10n/l10n.dart';

class LicenseListItem extends StatelessWidget {
  const LicenseListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListTile(
      title: Text(l10n.settings_licenses),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        const LicenseRoute().go(context);
      },
    );
  }
}
