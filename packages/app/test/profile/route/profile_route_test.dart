// ignore_for_file: prefer_const_constructors

import 'package:app/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';
import '../../app_web_view/mock_in_app_web_view_platform.dart';

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  const id = 'id';

  group(ProfileRoute, () {
    late GoRouterState state;

    setUp(() {
      state = _MockGoRouterState();
    });

    ProfileRoute createSubject() {
      return ProfileRoute(id: id);
    }

    test('is a $GoRouteData', () {
      final route = createSubject();
      expect(route, isA<GoRouteData>());
    });

    group('config', () {
      test('has correct type', () {
        expect(
          ProfileRoute.config,
          isA<TypedGoRoute<ProfileRoute>>(),
        );
      });

      test('has correct path', () {
        expect(
          ProfileRoute.config.path,
          '/profile/:id',
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

      testWidgets('renders $ProfilePage with correct data', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = tester.widget<ProfilePage>(
          find.byType(ProfilePage),
        );
        expect(widget.id, id);
      });
    });
  });
}
