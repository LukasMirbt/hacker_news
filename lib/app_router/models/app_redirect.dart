import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';

class AppRedirect {
  const AppRedirect();

  FutureOr<String?> redirect(
    BuildContext context,
    GoRouterState state,
  ) {
    if (state.matchedLocation == '/') {
      return AppRouter.initialLocation;
    }
    return null;
  }
}
