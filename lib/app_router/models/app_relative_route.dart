import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:path/path.dart';

mixin AppRelativeRoute on GoRouteData implements AppRoute {
  String get relativeLocation;

  void goRelative(BuildContext context);

  Future<T?> pushRelative<T>(BuildContext context);

  void pushReplacementRelative(BuildContext context);

  void replaceRelative(BuildContext context);

  @override
  String get navigationLocation => relativeLocation;

  @override
  String from(GoRouter router) {
    final currentLocation = router.state.matchedLocation;
    return join(currentLocation, location);
  }
}
