import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';

class LoginRedirectFromModel {
  const LoginRedirectFromModel();

  String from({
    required AppRoute route,
    required GoRouter goRouter,
  }) {
    final from = goRouter.state.uri;

    if (route is AppRelativeRoute) {
      final newPath = '${from.path}/${route.location}';
      final newUri = from.replace(path: newPath);
      return newUri.toString();
    }

    return from.toString();
  }
}
