import 'package:app/app_router/app_router.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:app/home/home.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter({
    required AppRouteList appRouteList,
    required AppRedirect appRedirect,
    required LoginRedirectModel loginRedirectModel,
    GoRouter? goRouter,
  }) : _redirectModel = loginRedirectModel,
       goRouter =
           goRouter ??
           GoRouter(
             restorationScopeId: 'router',
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

  final GoRouter goRouter;
  final LoginRedirectModel _redirectModel;

  String get matchedLocation => goRouter.state.matchedLocation;

  String get currentLocation => goRouter.state.uri.toString();

  String get from =>
      goRouter.state.uri.queryParameters['from'] ?? AppRouter.initialLocation;

  void go(GoRouteData route) {
    final redirect = _redirectModel.redirect(
      goRouter: goRouter,
      route: route,
    );

    if (redirect != null) {
      goRouter.push(redirect);
      return;
    }

    goRouter.go(route.location);
  }

  Future<T?> push<T extends Object?>(GoRouteData route) {
    final redirect = _redirectModel.redirect(
      goRouter: goRouter,
      route: route,
    );

    if (redirect != null) {
      goRouter.push(redirect);
      return Future.value();
    }

    return goRouter.push(route.location);
  }

  void goRelative(RelativeGoRouteData route) {
    final redirect = _redirectModel.redirect(
      goRouter: goRouter,
      route: route,
    );

    if (redirect != null) {
      goRouter.push(redirect);
      return;
    }

    goRouter.go(route.relativeLocation);
  }

  Future<T?> pushRelative<T extends Object?>(RelativeGoRouteData route) {
    final redirect = _redirectModel.redirect(
      goRouter: goRouter,
      route: route,
    );

    if (redirect != null) {
      goRouter.push(redirect);
      return Future.value();
    }

    return goRouter.push(route.relativeLocation);
  }

  void goBranch(
    StatefulNavigationShell shell,
    int index,
  ) {
    final destination = AppDestination.values[index];

    final redirect = _redirectModel.redirect(
      goRouter: goRouter,
      route: destination.route,
    );

    if (redirect != null) {
      goRouter.push(redirect);
      return;
    }

    shell.goBranch(index);
  }

  void dispose() {
    goRouter.dispose();
  }
}
