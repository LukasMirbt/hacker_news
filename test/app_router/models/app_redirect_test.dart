// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(AppRedirect, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
      when(() => state.matchedLocation).thenReturn('matchedLocation');
    });

    AppRedirect createSubject() => AppRedirect();

    group('redirect', () {
      Future<String?> redirect(
        WidgetTester tester, {
        bool? isWeb,
      }) async {
        final child = Container();
        await tester.pumpApp(child);
        final context = tester.element(find.byWidget(child));
        final appRedirect = createSubject();
        return appRedirect.redirect(context, state);
      }

      testWidgets('returns $AppRouter.initialLocation '
          'when matchedLocation is "/"', (
        tester,
      ) async {
        when(() => state.matchedLocation).thenReturn('/');
        final location = await redirect(tester);
        expect(location, AppRouter.initialLocation);
      });

      testWidgets('returns null when matchedLocation is not "/"', (
        tester,
      ) async {
        final location = await redirect(tester);
        expect(location, null);
      });
    });
  });
}
