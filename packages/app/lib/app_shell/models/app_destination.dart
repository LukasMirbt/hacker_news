import 'package:app/app_shell/app_shell.dart';
import 'package:go_router/go_router.dart';

enum AppDestination {
  home,
  search,
  threads,
  drafts,
  settings;

  RouteData get route {
    return switch (this) {
      AppDestination.home => const HomeRoute(),
      AppDestination.search => const SearchRoute(),
      AppDestination.threads => const ThreadFeedRoute(),
      AppDestination.drafts => const DraftRoute(),
      AppDestination.settings => const SettingsRoute(),
    };
  }
}
