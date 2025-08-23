import 'package:app/l10n/l10n.dart';
import 'package:flutter/material.dart';

extension ThemeModeExtension on ThemeMode {
  String label(AppLocalizations l10n) {
    return switch (this) {
      ThemeMode.system => l10n.theme_systemMode,
      ThemeMode.light => l10n.theme_lightMode,
      ThemeMode.dark => l10n.theme_darkMode,
    };
  }
}
