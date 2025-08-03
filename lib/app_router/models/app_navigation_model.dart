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
  }) {
    final redirect = _redirectModel.redirect(
      route: route,
      goRouter: goRouter,
    );

    if (redirect != null) {
      goRouter.push(redirect);
      return;
    }

    Object? extra;

    try {
      // Attempt to access $extra dynamically
      extra = (route as dynamic).$extra;
    } on NoSuchMethodError {
      // If it doesn't exist, 'extra' remains null
      extra = null;
    }

    goRouter.go(
      route.navigationLocation,
      extra: extra,
    );
  }

  Future<T?> push<T extends Object?>({
    required AppRoute route,
    required GoRouter goRouter,
  }) {
    final redirect = _redirectModel.redirect(
      route: route,
      goRouter: goRouter,
    );

    if (redirect != null) {
      goRouter.push(redirect);
      return Future.value();
    }

    return goRouter.push(route.navigationLocation);
  }
}
