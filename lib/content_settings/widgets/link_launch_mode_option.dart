import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/content_settings/content_settings.dart';
import 'package:hacker_client/l10n/l10n.dart';

class LinkLaunchModeOption extends StatelessWidget {
  const LinkLaunchModeOption(this.value, {super.key});

  final LinkLaunchMode value;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final label = value.label(l10n);

    return RadioListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
      ),
      title: Text(label),
      value: value,
    );
  }
}
