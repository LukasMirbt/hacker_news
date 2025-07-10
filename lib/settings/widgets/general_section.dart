import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/settings/settings.dart';

class GeneralSection extends StatelessWidget {
  const GeneralSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Title(),
        SizedBox(height: AppSpacing.lg),
        DataCollectionListItem(),
        LicenseListItem(),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final l10n = AppLocalizations.of(context);

    return Text(
      l10n.settings_generalSectionTitle,
      style: textTheme.titleMedium,
    );
  }
}
