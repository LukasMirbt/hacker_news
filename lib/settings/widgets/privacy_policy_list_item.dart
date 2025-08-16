import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/settings/settings.dart';

class PrivacyPolicyListItem extends StatelessWidget {
  const PrivacyPolicyListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListTile(
      leading: const AppIcon(Symbols.privacy_tip_rounded),
      title: Text(l10n.settings_privacyPolicy),
      trailing: const AppIcon(Symbols.launch_rounded),
      onTap: () {
        context.read<SettingsBloc>().add(
          const SettingsPrivacyPolicyPressed(),
        );
      },
    );
  }
}
