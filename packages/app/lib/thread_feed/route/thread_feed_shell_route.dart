import 'package:app/app_shell/app_shell.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_repository/thread_repository.dart';

class ThreadFeedShellRoute extends ShellRouteData {
  const ThreadFeedShellRoute();

  static const config = TypedShellRoute<ThreadFeedShellRoute>(
    routes: [
      ThreadFeedRoute.config,
    ],
  );

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) {
    return RepositoryProvider(
      create: (context) => ThreadRepository(
        threadApi: context.read<ThreadApi>(),
      ),
      child: navigator,
    );
  }
}
