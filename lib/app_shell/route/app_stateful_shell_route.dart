import 'package:app_ui/app_ui.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/comment_form/comment_form.dart';
import 'package:hacker_client/comment_options/comment_options.dart';
import 'package:hacker_client/feed_item_options/feed_item_options.dart';
import 'package:hacker_client/home/home.dart';
import 'package:hacker_client/post/post.dart';
import 'package:hacker_client/post_options/post_options.dart';
import 'package:hacker_client/reply_form/reply_form.dart';
import 'package:hacker_client/settings/settings.dart';
import 'package:provider/provider.dart';

part '../../comment_form/route/comment_form_route.dart';
part '../../comment_options/route/comment_options_route.dart';
part '../../feed_item_options/route/feed_item_options_route.dart';
part '../../home/route/home_route.dart';
part '../../post/route/post_route.dart';
part '../../post_options/route/post_options_route.dart';
part '../../reply_form/route/reply_form_route.dart';
part '../../settings/route/settings_route.dart';
part 'app_stateful_shell_route.g.dart';

@AppStatefulShellRoute.config
class AppStatefulShellRoute extends StatefulShellRouteData {
  const AppStatefulShellRoute();

  static const config = TypedStatefulShellRoute<AppStatefulShellRoute>(
    branches: [
      HomeBranch.config,
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
