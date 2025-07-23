// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_consent_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$analyticsConsentRoute];

RouteBase get $analyticsConsentRoute => GoRouteData.$route(
  path: '/analytics-consent',

  factory: _$AnalyticsConsentRoute._fromState,
);

mixin _$AnalyticsConsentRoute on GoRouteData {
  static AnalyticsConsentRoute _fromState(GoRouterState state) =>
      const AnalyticsConsentRoute();

  String get location => GoRouteData.$location('/analytics-consent');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
