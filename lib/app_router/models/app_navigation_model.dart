import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';

class AppNavigationModel {
  const AppNavigationModel({
    required LoginRedirectModel loginRedirectModel,
  }) : _redirectModel = loginRedirectModel;

  final LoginRedirectModel _redirectModel;

  void go({
    required AppRoute route,
    required GoRouter goRouter,
    required Object? extra,
  }) {
    final redirect = _redirectModel.redirect(
      route: route,
      goRouter: goRouter,
    );

    if (redirect != null) {
      goRouter.push(redirect);
      return;
    }

    goRouter.go(
      route.navigationLocation,
      extra: extra,
    );
  }

  Future<T?> push<T extends Object?>({
    required AppRoute route,
    required GoRouter goRouter,
    required Object? extra,
  }) {
    final redirect = _redirectModel.redirect(
      route: route,
      goRouter: goRouter,
    );

    if (redirect != null) {
      goRouter.push(redirect);
      return Future.value();
    }

    return goRouter.push(
      route.navigationLocation,
      extra: extra,
    );
  }
}
