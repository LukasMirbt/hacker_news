import 'package:flutter/material.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:material_symbols_icons/symbols.dart';

enum AppDestination {
  home,
  threads,
  settings;

  String label(AppLocalizations l10n) => switch (this) {
    AppDestination.home => l10n.appShell_home,
    AppDestination.threads => l10n.appShell_threads,
    AppDestination.settings => l10n.appShell_settings,
  };

  IconData get icon => switch (this) {
    AppDestination.home => Symbols.home,
    AppDestination.threads => Symbols.forum,
    AppDestination.settings => Symbols.settings,
  };
}
