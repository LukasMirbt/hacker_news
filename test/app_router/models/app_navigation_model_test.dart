// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:mocktail/mocktail.dart';

class _MockLoginRedirectModel extends Mock implements LoginRedirectModel {}

class _MockAppRoute extends Mock implements AppRoute {}

class _MockGoRouter extends Mock implements GoRouter {}

void main() {
  const extra = 'extra';
  const redirect = 'redirect';
  const navigationLocation = 'navigationLocation';

  group(AppNavigationModel, () {
    late LoginRedirectModel redirectModel;
    late AppRoute route;
    late GoRouter goRouter;

    setUp(() {
      redirectModel = _MockLoginRedirectModel();
      route = _MockAppRoute();
      goRouter = _MockGoRouter();
    });

    AppNavigationModel createSubject() {
      return AppNavigationModel(
        loginRedirectModel: redirectModel,
      );
    }

    final redirectMethod = () => redirectModel.redirect(
      route: route,
      goRouter: goRouter,
    );

    group('go', () {
      test('pushes redirect and returns when non-null', () {
        final pushRedirect = () => goRouter.push(redirect);
        when(redirectMethod).thenReturn(redirect);
        when(pushRedirect).thenAnswer((_) async => null);
        final model = createSubject();
        model.go(
          route: route,
          goRouter: goRouter,
          extra: extra,
        );
        verify(pushRedirect).called(1);
        verifyNever(
          () => goRouter.go(
            any(),
            extra: any(named: 'extra'),
          ),
        );
      });

      test('calls go when redirect is null', () {
        when(() => route.navigationLocation).thenReturn(navigationLocation);
        final model = createSubject();
        model.go(
          route: route,
          goRouter: goRouter,
          extra: extra,
        );
        verify(
          () => goRouter.go(
            route.navigationLocation,
            extra: extra,
          ),
        ).called(1);
      });
    });

    group('push', () {
      test('pushes redirect and returns when non-null', () {
        final pushRedirect = () => goRouter.push(redirect);
        when(redirectMethod).thenReturn(redirect);
        when(pushRedirect).thenAnswer((_) async => null);
        final model = createSubject();
        expect(
          model.push(
            route: route,
            goRouter: goRouter,
            extra: extra,
          ),
          completes,
        );
        verify(pushRedirect).called(1);
        verifyNever(
          () => goRouter.push(
            navigationLocation,
            extra: any(named: 'extra'),
          ),
        );
      });

      test('calls push when redirect is null', () {
        when(() => route.navigationLocation).thenReturn(navigationLocation);
        final push = () => goRouter.push<String>(
          navigationLocation,
          extra: extra,
        );
        const result = 'result';
        when(push).thenAnswer((_) async => result);
        final model = createSubject();
        expect(
          model.push<String>(
            route: route,
            goRouter: goRouter,
            extra: extra,
          ),
          completion(result),
        );
        verify(push).called(1);
      });
    });
  });
}
