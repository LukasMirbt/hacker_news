import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';
import 'package:hacker_client/app/app.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/network_error/network_error.dart';

class AppRedirect {
  const AppRedirect();

  FutureOr<String?> redirect(
    BuildContext context,
    GoRouterState state,
  ) {
    final authenticationBloc = context.read<AuthenticationBloc>();
    final authenticationStatus = authenticationBloc.state.status;

    final uri = state.uri;
    final matchedLocation = state.matchedLocation;

    final networkErrorRoute = NetworkErrorRoute(
      from: uri.toString(),
    );

    final networkErrorUrl = Uri.parse(networkErrorRoute.location);
    final networkErrorPath = networkErrorUrl.path;

    if (authenticationStatus.isNetworkError) {
      if (matchedLocation == networkErrorPath) return null;
      return networkErrorUrl.toString();
    }

    if (matchedLocation == networkErrorPath) {
      final from = uri.queryParameters['from']!;
      return from;
    }

    final appBloc = context.read<AppBloc>();
    final appStatus = appBloc.state.status;

    const analyticsConsentRoute = AnalyticsConsentRoute();
    final analyticsConsentUri = Uri.parse(analyticsConsentRoute.location);
    final analyticsConsentPath = analyticsConsentUri.path;

    if (appStatus == AppStatus.analyticsConsent) {
      if (matchedLocation == analyticsConsentPath) return null;
      return analyticsConsentUri.toString();
    }

    final initialLocation = AppRouter.initialLocation;

    if (matchedLocation == analyticsConsentPath) {
      return initialLocation;
    }

    if (matchedLocation == '/') {
      return initialLocation;
    }

    return null;
  }
}
