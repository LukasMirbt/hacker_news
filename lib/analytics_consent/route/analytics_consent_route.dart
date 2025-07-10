import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';

part 'analytics_consent_route.g.dart';

@AnalyticsConsentRoute.config
class AnalyticsConsentRoute extends GoRouteData with _$AnalyticsConsentRoute {
  const AnalyticsConsentRoute();

  static const config = TypedGoRoute<AnalyticsConsentRoute>(
    path: '/analytics-consent',
  );

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const AnalyticsConsentPage();
  }
}
