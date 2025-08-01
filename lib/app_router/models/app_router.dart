import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';

class AppRouter {
  AppRouter({
    required AppRouteList appRouteList,
    required AppRedirect appRedirect,
    required AppNavigationModel appNavigationModel,
    GoRouter? goRouter,
  }) : _navigationModel = appNavigationModel,
       goRouter =
           goRouter ??
           GoRouter(
             navigatorKey: navigatorKey,
             initialLocation: initialLocation,
             routes: appRouteList.routes,
             redirect: appRedirect.redirect,
           );

  static final navigatorKey = GlobalKey<NavigatorState>();

  static final initialLocation = const HomeRoute().location;

  static AppRouter of(BuildContext context) {
    return context.read<AppRouter>();
  }

  final AppNavigationModel _navigationModel;
  final GoRouter goRouter;

  String get matchedLocation => goRouter.state.matchedLocation;
  String get from => goRouter.state.uri.toString();

  void go(AppAbsoluteRoute route) {
    return _navigationModel.go(
      goRouter: goRouter,
      route: route,
    );
  }

  Future<T?> push<T extends Object?>(
    AppAbsoluteRoute route,
  ) {
    return _navigationModel.push(
      goRouter: goRouter,
      route: route,
    );
  }

  void goRelative(AppRelativeRoute route) {
    return _navigationModel.go(
      goRouter: goRouter,
      route: route,
    );
  }

  Future<T?> pushRelative<T extends Object?>(
    AppRelativeRoute route,
  ) {
    return _navigationModel.push(
      goRouter: goRouter,
      route: route,
    );
  }
}
