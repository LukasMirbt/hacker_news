import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/login/route/login_route.dart';

mixin AuthenticatedRoute on GoRouteData {
  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    final status = context.read<AuthenticationBloc>().state.status;

    if (!status.isAuthenticated) {
      final appRouterState = context.read<AppRouterBloc>().state;
      final previousLocation = appRouterState.location;
      final matchedLocation = state.matchedLocation;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        LoginRoute(from: matchedLocation).push<void>(context);
      });

      return previousLocation;
    }

    return null;
  }
}
