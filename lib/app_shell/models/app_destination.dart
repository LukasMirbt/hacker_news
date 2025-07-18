import 'package:flutter/material.dart';
import 'package:hacker_client/l10n/l10n.dart';

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
    AppDestination.home => Icons.home_outlined,
    AppDestination.threads => Icons.forum_outlined,
    AppDestination.settings => Icons.settings_outlined,
  };

  IconData get selectedIcon => switch (this) {
    AppDestination.home => Icons.home,
    AppDestination.threads => Icons.forum,
    AppDestination.settings => Icons.settings,
  };
}
