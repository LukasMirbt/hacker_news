// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:mocktail/mocktail.dart';

class _MockAppRedirect extends Mock implements AppRedirect {}

class _MockAppRouteList extends Mock implements AppRouteList {}

class _MockBuildContext extends Mock implements BuildContext {}

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(AppRouter, () {
    late AppRedirect appRedirect;
    late AppRouteList appRouteList;
    late BuildContext context;
    late GoRouterState state;

    setUp(() {
      appRedirect = _MockAppRedirect();
      appRouteList = _MockAppRouteList();
      context = _MockBuildContext();
      state = _MockGoRouterState();
      when(() => appRouteList.routes).thenReturn([]);
    });

    AppRouter createSubject() {
      return AppRouter(
        appRedirect: appRedirect,
        appRouteList: appRouteList,
      );
    }

    group('navigatorKey', () {
      test('returns ${GlobalKey<NavigatorState>}', () {
        expect(
          AppRouter.navigatorKey,
          isA<GlobalKey<NavigatorState>>(),
        );
      });
    });

    group('initialLocation', () {
      test('returns correct value', () {
        expect(
          AppRouter.initialLocation,
          HomeRoute().location,
        );
      });
    });

    group('goRouter', () {
      test('has correct navigatorKey', () {
        final appRouter = createSubject();
        expect(
          appRouter.goRouter.configuration.navigatorKey,
          AppRouter.navigatorKey,
        );
      });

      test('has correct initialLocation', () {
        final appRouter = createSubject();
        expect(
          appRouter.goRouter.routeInformationProvider.value.uri.path,
          AppRouter.initialLocation,
        );
      });

      test('has correct routes', () {
        final routes = <RouteBase>[];
        when(() => appRouteList.routes).thenReturn(routes);
        final router = createSubject();
        expect(
          router.goRouter.configuration.routes,
          same(routes),
        );
      });

      test('has correct redirect', () {
        final router = createSubject();
        router.goRouter.configuration.topRedirect(context, state);
        verify(
          () => appRedirect.redirect(context, state),
        ).called(1);
      });
    });
  });
}
