import 'package:app/l10n/l10n.dart';
import 'package:app/theme/theme.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ThemeRadioOption extends StatelessWidget {
  const ThemeRadioOption(this.value, {super.key});

  final ThemeMode value;

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
