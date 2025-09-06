import 'package:app/drafts/drafts.dart';
import 'package:app/home/home.dart';
import 'package:app/search/search.dart';
import 'package:app/settings/settings.dart';
import 'package:app/thread_feed/thread_feed.dart';
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
