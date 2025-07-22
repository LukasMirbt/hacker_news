import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';
import 'package:hacker_client/app/app.dart';
import 'package:hacker_client/app_router/app_router.dart';

class AppRedirect {
  const AppRedirect();

  FutureOr<String?> redirect(
    BuildContext context,
    GoRouterState state,
  ) {
    final bloc = context.read<AppBloc>();
    final status = bloc.state.status;

    final analyticsConsentLocation = const AnalyticsConsentRoute().location;

    if (status == AppStatus.analyticsConsent) {
      return analyticsConsentLocation;
    }

    final initialLocation = AppRouter.initialLocation;
    final matchedLocation = state.matchedLocation;

    if (matchedLocation == analyticsConsentLocation) {
      return initialLocation;
    }

    if (matchedLocation == '/') {
      return initialLocation;
    }

    return null;
  }
}
