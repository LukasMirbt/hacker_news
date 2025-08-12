import 'package:app_ui/app_ui.dart';
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
        icon: Symbols.home_rounded,
        label: l10n.appShell_home,
      ),
      AppDestination.threads => DestinationData(
        icon: Symbols.forum_rounded,
        label: l10n.appShell_threads,
      ),
      AppDestination.drafts => DestinationData(
        icon: Symbols.drafts_rounded,
        label: l10n.appShell_drafts,
      ),
      AppDestination.settings => DestinationData(
        icon: Symbols.settings_rounded,
        label: l10n.appShell_settings,
      ),
    };
  }
}
