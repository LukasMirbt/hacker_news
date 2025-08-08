import 'package:draft_repository/draft_repository.dart';
import 'package:draft_storage/draft_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';

class DraftShellRoute extends ShellRouteData {
  const DraftShellRoute();

  static const config = TypedShellRoute<DraftShellRoute>(
    routes: [
      DraftRoute.config,
    ],
  );

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) {
    return RepositoryProvider(
      create: (context) => DraftRepository(
        draftStorage: context.read<DraftStorage>(),
      ),
      child: navigator,
    );
  }
}
