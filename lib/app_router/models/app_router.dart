import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_router/models/login_redirect_model.dart';
import 'package:hacker_client/app_shell/app_shell.dart';

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
  String get from => goRouter.state.uri.toString();

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
}
