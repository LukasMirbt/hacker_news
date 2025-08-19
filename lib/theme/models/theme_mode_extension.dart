import 'package:flutter/material.dart';
import 'package:hacker_client/l10n/l10n.dart';

extension ThemeModeExtension on ThemeMode {
  String label(AppLocalizations l10n) {
    return switch (this) {
      ThemeMode.system => l10n.theme_systemMode,
      ThemeMode.light => l10n.theme_lightMode,
      ThemeMode.dark => l10n.theme_darkMode,
    };
  }
}
