import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/content_settings/content_settings.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:link_launcher/link_launcher.dart';

class LinkLaunchModeRadioOption extends StatelessWidget {
  const LinkLaunchModeRadioOption(this.value, {super.key});

  final LinkLaunchMode value;

  @override
  Widget build(BuildContext context) {
    final groupValue = context.select(
      (ContentSettingsBloc bloc) => bloc.state.linkLaunchMode,
    );

    final targetPlatform = Theme.of(context).platform;
    final l10n = AppLocalizations.of(context);
    final title = value.title(l10n);
    final subtitle = value.subtitle(l10n, targetPlatform);

    return RadioListTile(
      groupValue: groupValue,
      onChanged: (value) {
        if (value != null) {
          context.read<ContentSettingsBloc>().add(
            ContentSettingsLinkLaunchModeChanged(value),
          );
        }
      },
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
    );
  }
}
