import 'package:app_ui/app_ui.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/data_collection/data_collection.dart';
import 'package:hacker_client/feed_item_options/feed_item_options.dart';
import 'package:hacker_client/home/home.dart';
import 'package:hacker_client/settings/settings.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart' hide ThreadFeedItem;
import 'package:hacker_client/thread_item_options/thread_item_options.dart';
import 'package:provider/provider.dart';
import 'package:thread_repository/thread_repository.dart';

part '../../data_collection/route/data_collection_route.dart';
part '../../feed_item_options/route/feed_item_options_route.dart';
part '../../home/route/home_route.dart';
part '../../licenses/route/license_route.dart';
part '../../settings/route/settings_route.dart';
part '../../thread_feed/route/thread_feed_route.dart';
part '../../thread_item_options/route/thread_item_options_route.dart';
part 'app_stateful_shell_route.g.dart';

@AppStatefulShellRoute.config
class AppStatefulShellRoute extends StatefulShellRouteData {
  const AppStatefulShellRoute();

  static const config = TypedStatefulShellRoute<AppStatefulShellRoute>(
    branches: [
      HomeBranch.config,
      ThreadFeedBranch.config,
      SettingsBranch.config,
    ],
  );

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return RepositoryProvider(
      create: (context) => FeedRepository(
        feedApi: context.read<FeedApi>(),
      ),
      child: Provider.value(
        value: navigationShell,
        child: const AppShell(),
      ),
    );
  }
}
