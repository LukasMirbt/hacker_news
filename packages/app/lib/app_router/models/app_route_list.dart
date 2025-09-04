import 'package:app/analytics_consent/analytics_consent.dart'
    as analytics_consent;
import 'package:app/app_shell/app_shell.dart' as app_shell;
import 'package:app/login/login.dart' as login;
import 'package:app/login_loading/login_loading.dart' as login_loading;
import 'package:app/logout_loading/logout_loading.dart' as logout_loading;
import 'package:app/profile/profile.dart' as profile;
import 'package:app/web_redirect/web_redirect.dart' as web_redirect;
import 'package:go_router/go_router.dart';

class AppRouteList {
  AppRouteList()
    : routes = [
        ...analytics_consent.$appRoutes,
        ...app_shell.$appRoutes,
        ...login.$appRoutes,
        ...login_loading.$appRoutes,
        ...logout_loading.$appRoutes,
        ...profile.$appRoutes,
        ...web_redirect.$appRoutes,
      ];

  final List<RouteBase> routes;
}
