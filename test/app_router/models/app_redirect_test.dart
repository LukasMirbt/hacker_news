// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';
import 'package:hacker_client/app/app.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

class _MockAppState extends Mock implements AppState {}

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  group(AppRedirect, () {
    late AppBloc appBloc;
    late AppState appState;
    late GoRouterState goRouterState;

    setUp(() {
      appBloc = _MockAppBloc();
      appState = _MockAppState();
      goRouterState = _MockGoRouterState();
      when(() => appBloc.state).thenReturn(appState);
      when(() => appState.status).thenReturn(AppStatus.home);
      when(() => goRouterState.matchedLocation).thenReturn('matchedLocation');
    });

    AppRedirect createSubject() => AppRedirect();

    group('redirect', () {
      Future<String?> redirect(
        WidgetTester tester, {
        bool? isWeb,
      }) async {
        final child = Container();
        await tester.pumpApp(
          BlocProvider.value(
            value: appBloc,
            child: child,
          ),
        );
        final context = tester.element(find.byWidget(child));
        final appRedirect = createSubject();
        return appRedirect.redirect(context, goRouterState);
      }

      final analyticsConsentLocation = AnalyticsConsentRoute().location;
      final initialLocation = AppRouter.initialLocation;

      testWidgets('returns analyticsConsentLocation '
          'when status is ${AppStatus.analyticsConsent}', (tester) async {
        when(() => appState.status).thenReturn(AppStatus.analyticsConsent);
        final location = await redirect(tester);
        expect(location, analyticsConsentLocation);
      });

      testWidgets(
        'returns initialLocation when status is not '
        '${AppStatus.analyticsConsent} and matchedLocation '
        'is analyticsConsentLocation',
        (tester) async {
          when(
            () => goRouterState.matchedLocation,
          ).thenReturn(
            analyticsConsentLocation,
          );
          final location = await redirect(tester);
          expect(location, initialLocation);
        },
      );

      testWidgets('returns initialLocation when status is not '
          '${AppStatus.analyticsConsent} and matchedLocation '
          'is "/"', (tester) async {
        when(() => goRouterState.matchedLocation).thenReturn('/');
        final location = await redirect(tester);
        expect(location, initialLocation);
      });

      testWidgets('returns null when status is not '
          '${AppStatus.analyticsConsent} and matchedLocation '
          'is not "/"', (tester) async {
        final location = await redirect(tester);
        expect(location, null);
      });
    });
  });
}
