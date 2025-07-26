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
        model.go(route: route, goRouter: goRouter);
        verify(pushRedirect).called(1);
        verifyNever(() => goRouter.go(any()));
      });

      test('calls go when redirect is null', () {
        when(() => route.navigationLocation).thenReturn(navigationLocation);
        final model = createSubject();
        model.go(route: route, goRouter: goRouter);
        verify(
          () => goRouter.go(route.navigationLocation),
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
          model.push(route: route, goRouter: goRouter),
          completes,
        );
        verify(pushRedirect).called(1);
        verifyNever(
          () => goRouter.push(navigationLocation),
        );
      });

      test('calls push when redirect is null', () {
        when(() => route.navigationLocation).thenReturn(navigationLocation);
        final push = () => goRouter.push<String>(navigationLocation);
        const result = 'result';
        when(push).thenAnswer((_) async => result);
        final model = createSubject();
        expect(
          model.push<String>(route: route, goRouter: goRouter),
          completion(result),
        );
        verify(push).called(1);
      });
    });
  });
}
