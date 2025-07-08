// ignore_for_file: unnecessary_lambdas, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart'
    show InAppWebViewPlatform;
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/web_redirect/web_redirect.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';
import '../mock_in_app_web_view_platform.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  const url = 'https://example.com';

  group(WebRedirectRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    WebRedirectRoute createSubject() {
      return WebRedirectRoute(url: url);
    }

    test('is a $GoRouteData', () {
      final route = createSubject();
      expect(route, isA<GoRouteData>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          WebRedirectRoute.config,
          isA<TypedGoRoute<WebRedirectRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          WebRedirectRoute.config.path,
          '/web-redirect',
        );
      });
    });

    group('buildPage', () {
      late Page<void> page;

      setUp(() {
        InAppWebViewPlatform.instance = MockInAppWebViewPlatform();
      });

      Widget buildSubject() {
        final route = createSubject();
        return Builder(
          builder: (context) {
            page = route.buildPage(context, state);
            return Navigator(
              onDidRemovePage: (_) {},
              pages: [page],
            );
          },
        );
      }

      testWidgets('returns correct page', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(
          page,
          isA<MaterialPage<void>>().having(
            (page) => page.fullscreenDialog,
            'fullscreenDialog',
            true,
          ),
        );
      });

      testWidgets('renders $WebRedirectPage with correct url', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = tester.widget<WebRedirectPage>(
          find.byType(WebRedirectPage),
        );
        expect(widget.url, url);
      });
    });
  });
}
