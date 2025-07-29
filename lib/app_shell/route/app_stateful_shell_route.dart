import 'package:equatable/equatable.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:hacker_client/data_collection/data_collection.dart';
import 'package:hacker_client/home/home.dart';
import 'package:hacker_client/post/post.dart';
import 'package:hacker_client/reply/reply.dart';
import 'package:hacker_client/settings/settings.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:provider/provider.dart';

part '../../comment/route/comment_route.dart';
part '../../data_collection/route/data_collection_route.dart';
part '../../home/route/home_route.dart';
part '../../post/route/post_route.dart';
part '../../reply/route/reply_route.dart';
part '../../settings/route/settings_route.dart';
part '../../thread_feed/route/thread_feed_route.dart';
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
