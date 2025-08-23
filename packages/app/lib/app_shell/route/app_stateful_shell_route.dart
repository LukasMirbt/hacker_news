import 'package:app/about/about.dart';
import 'package:app/app_router/app_router.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:app/comment/comment.dart';
import 'package:app/content_settings/content_settings.dart';
import 'package:app/data_collection/data_collection.dart';
import 'package:app/drafts/drafts.dart';
import 'package:app/home/home.dart';
import 'package:app/post/post.dart';
import 'package:app/reply/reply.dart' hide ReplyParent;
import 'package:app/settings/settings.dart';
import 'package:app/theme/theme.dart';
import 'package:app/thread_feed/thread_feed.dart';
import 'package:equatable/equatable.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:visited_post_storage/visited_post_storage.dart';

part '../../about/route/about_route.dart';
part '../../comment/route/comment_route.dart';
part '../../content_settings/route/content_settings_route.dart';
part '../../data_collection/route/data_collection_route.dart';
part '../../drafts/route/draft_route.dart';
part '../../home/route/home_route.dart';
part '../../post/route/post_route.dart';
part '../../reply/route/reply_route.dart';
part '../../settings/route/settings_route.dart';
part '../../theme/route/theme_route.dart';
part '../../thread_feed/route/thread_feed_route.dart';
part 'app_stateful_shell_route.g.dart';

@AppStatefulShellRoute.config
class AppStatefulShellRoute extends StatefulShellRouteData {
  const AppStatefulShellRoute();

  static const config = TypedStatefulShellRoute<AppStatefulShellRoute>(
    branches: [
      HomeBranch.config,
      ThreadFeedBranch.config,
      DraftBranch.config,
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
        visitedPostStorage: context.read<VisitedPostStorage>(),
      ),
      child: Provider.value(
        value: navigationShell,
        child: const AppShell(),
      ),
    );
  }
}
