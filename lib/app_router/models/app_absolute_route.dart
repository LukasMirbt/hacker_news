import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';

mixin AppAbsoluteRoute on GoRouteData implements AppRoute {
  void go(BuildContext context);

  Future<T?> push<T>(BuildContext context);

  void pushReplacement(BuildContext context);

  void replace(BuildContext context);

  @override
  String get navigationLocation => location;

  @override
  String from(GoRouter router) => router.state.matchedLocation;
}
