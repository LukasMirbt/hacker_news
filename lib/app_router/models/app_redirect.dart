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

    final url = state.uri.toString();
    final networkErrorRoute = NetworkErrorRoute(from: url);
    final networkErrorLocation = networkErrorRoute.location;

    print('status: $authenticationStatus');
    print('redirect: $url');

    if (authenticationStatus.isNetworkError) {
      if (url.startsWith('/network-error')) return null;
      return networkErrorLocation;
    }

    final appBloc = context.read<AppBloc>();
    final appStatus = appBloc.state.status;

    final analyticsConsentLocation = const AnalyticsConsentRoute().location;

    if (appStatus == AppStatus.analyticsConsent) {
      return analyticsConsentLocation;
    }

    final initialLocation = AppRouter.initialLocation;

    if (url.startsWith(analyticsConsentLocation)) {
      return initialLocation;
    }

    if (url == '/') {
      return initialLocation;
    }

    return null;
  }
}
