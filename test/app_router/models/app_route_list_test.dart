// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart'
    as analytics_consent;
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart' as app_tab;
import 'package:hacker_client/login/login.dart' as login;
import 'package:hacker_client/login_loading/login_loading.dart'
    as login_loading;
import 'package:hacker_client/logout_loading/logout_loading.dart'
    as logout_loading;
import 'package:hacker_client/web_redirect/web_redirect.dart' as web_redirect;

void main() {
  group(AppRouteList, () {});

  AppRouteList createSubject() => AppRouteList();

  group('routes', () {
    Iterable<String> paths(RouteBase routeBase) {
      if (routeBase is StatefulShellRoute) {
        return routeBase.routes.expand(paths);
      } else if (routeBase is ShellRoute) {
        return routeBase.routes.expand(paths);
      } else if (routeBase is GoRoute) {
        return [
          routeBase.path,
          ...routeBase.routes.expand(paths),
        ];
      }
      throw UnimplementedError(
        'Unexpected route type: ${routeBase.runtimeType}',
      );
    }

    late List<String> allPaths;

    setUp(() {
      final routeList = createSubject();
      allPaths = routeList.routes.expand(paths).toList();
    });

    test('contains analytics_consent routes', () {
      final analyticsConsentPaths = analytics_consent.$appRoutes.expand(paths);
      expect(
        allPaths,
        containsAll(analyticsConsentPaths),
      );
    });

    test('contains app_shell routes', () {
      final appTabPaths = app_tab.$appRoutes.expand(paths);
      expect(
        allPaths,
        containsAll(appTabPaths),
      );
    });

    test('contains login routes', () {
      final loginPaths = login.$appRoutes.expand(paths);
      expect(
        allPaths,
        containsAll(loginPaths),
      );
    });

    test('contains login_loading routes', () {
      final loginLoadingPaths = login_loading.$appRoutes.expand(paths);
      expect(
        allPaths,
        containsAll(loginLoadingPaths),
      );
    });

    test('contains logout_loading routes', () {
      final logoutLoadingPaths = logout_loading.$appRoutes.expand(paths);
      expect(
        allPaths,
        containsAll(logoutLoadingPaths),
      );
    });

    test('contains web_redirect routes', () {
      final webRedirectPaths = web_redirect.$appRoutes.expand(paths);
      expect(
        allPaths,
        containsAll(webRedirectPaths),
      );
    });
  });
}
