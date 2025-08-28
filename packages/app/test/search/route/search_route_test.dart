// ignore_for_file: prefer_const_constructors

import 'package:app/app_shell/app_shell.dart';
import 'package:app/post/post.dart';
import 'package:app/search/search.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';
import '../../app_web_view/mock_in_app_web_view_platform.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(SearchRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    SearchRoute createSubject() => SearchRoute();

    test('is a $GoRouteData', () {
      final route = createSubject();
      expect(route, isA<GoRouteData>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          SearchRoute.config,
          isA<TypedGoRoute<SearchRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          SearchRoute.config.path,
          '/search',
        );
      });

      test('has correct routes', () {
        expect(
          SearchRoute.config.routes,
          [
            PostShellRoute.config,
          ],
        );
      });
    });

    group('build', () {
      setUp(() {
        InAppWebViewPlatform.instance = MockInAppWebViewPlatform();
      });

      Widget buildSubject() {
        final route = createSubject();
        return Builder(
          builder: (context) => route.build(context, state),
        );
      }

      testWidgets('renders $SearchPage', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(SearchPage), findsOneWidget);
      });
    });
  });
}
