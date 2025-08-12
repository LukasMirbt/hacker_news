import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/l10n/l10n.dart';

enum AppDestination {
  home,
  threads,
  drafts,
  settings;

  RouteData get route => switch (this) {
    AppDestination.home => const HomeRoute(),
    AppDestination.threads => const ThreadFeedRoute(),
    AppDestination.drafts => const DraftRoute(),
    AppDestination.settings => const SettingsRoute(),
  };

  DestinationData data(AppLocalizations l10n) {
    return switch (this) {
      AppDestination.home => DestinationData(
        icon: Icons.home_outlined,
        selectedIcon: Icons.home,
        label: l10n.appShell_home,
      ),
      AppDestination.threads => DestinationData(
        icon: Icons.forum_outlined,
        selectedIcon: Icons.forum,
        label: l10n.appShell_threads,
      ),
      AppDestination.drafts => DestinationData(
        icon: Icons.drafts_outlined,
        selectedIcon: Icons.drafts,
        label: l10n.appShell_drafts,
      ),
      AppDestination.settings => DestinationData(
        icon: Icons.settings_outlined,
        selectedIcon: Icons.settings,
        label: l10n.appShell_settings,
      ),
    };
  }
}
