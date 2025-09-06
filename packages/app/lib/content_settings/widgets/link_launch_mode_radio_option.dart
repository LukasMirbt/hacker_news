import 'package:app/content_settings/content_settings.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:link_launcher/link_launcher.dart';

class LinkLaunchModeRadioOption extends StatelessWidget {
  const LinkLaunchModeRadioOption(this.value, {super.key});

  final LinkLaunchMode value;

  @override
  Widget build(BuildContext context) {
    final targetPlatform = Theme.of(context).platform;
    final l10n = AppLocalizations.of(context);
    final title = value.title(l10n);
    final subtitle = value.subtitle(l10n, targetPlatform);

    return RadioListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
    );
  }
}
