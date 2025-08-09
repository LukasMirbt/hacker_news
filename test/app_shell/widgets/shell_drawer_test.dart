// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/login/login.dart';
import 'package:hacker_client/version/version.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAppRouter extends Mock implements AppRouter {}

class _MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class _MockAuthenticationState extends Mock implements AuthenticationState {}

class _MockScaffold extends Scaffold {
  const _MockScaffold({required super.body});

  @override
  ScaffoldState createState() => _MockScaffoldState();
}

class _MockScaffoldState extends ScaffoldState {
  bool calledCloseDrawer = false;

  @override
  void closeDrawer() {
    calledCloseDrawer = true;
  }
}

class _MockStatefulNavigationShell extends Mock
    with Diagnosticable
    implements StatefulNavigationShell {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));
  const selectedIndex = 0;

  group(ShellDrawer, () {
    late AuthenticationBloc authenticationBloc;
    late AuthenticationState authenticationState;
    late AppRouter router;
    late StatefulNavigationShell shell;

    setUp(() {
      authenticationBloc = _MockAuthenticationBloc();
      authenticationState = _MockAuthenticationState();
      router = _MockAppRouter();
      shell = _MockStatefulNavigationShell();
      when(() => shell.currentIndex).thenReturn(selectedIndex);
      when(() => authenticationBloc.state).thenReturn(authenticationState);
      when(
        () => authenticationState.status,
      ).thenReturn(
        AuthenticationStatus.unauthenticated,
      );
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: BlocProvider.value(
          value: authenticationBloc,
          child: Provider.value(
            value: shell,
            child: _MockScaffold(
              body: ShellDrawer(),
            ),
          ),
        ),
      );
    }

    NavigationDrawer findWidget(WidgetTester tester) {
      return tester.widget<NavigationDrawer>(
        find.byType(NavigationDrawer),
      );
    }

    testWidgets('has correct selectedIndex', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = findWidget(tester);
      expect(widget.selectedIndex, selectedIndex);
    });

    testWidgets('has correct destinations', (tester) async {
      await tester.pumpApp(buildSubject());

      for (final destination in AppDestination.values) {
        final widget = tester.widget<ShellDrawerDestination>(
          find.bySubtype<NavigationDrawerDestination>().at(destination.index),
        );

        expect(
          widget.data,
          destination.data(l10n),
        );
      }
    });

    group('onDestinationSelected', () {
      testWidgets('calls goBranch and closeDrawer '
          'when index is not 1', (tester) async {
        const index = 0;
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onDestinationSelected?.call(index);
        final scaffoldState = tester.state<_MockScaffoldState>(
          find.byType(_MockScaffold),
        );
        verify(() => shell.goBranch(index)).called(1);
        expect(scaffoldState.calledCloseDrawer, true);
      });

      testWidgets('pushes $LoginRoute and returns '
          'when index is 1 and !isAuthenticated', (tester) async {
        const index = 1;
        final push = () => router.push(
          LoginRoute(
            from: const ThreadFeedRoute().location,
          ),
        );
        when(push).thenAnswer((_) async => null);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onDestinationSelected?.call(index);
        final scaffoldState = tester.state<_MockScaffoldState>(
          find.byType(_MockScaffold),
        );
        verify(push).called(1);
        verifyNever(() => shell.goBranch(any()));
        expect(scaffoldState.calledCloseDrawer, false);
      });

      testWidgets('calls goBranch and closeDrawer '
          'when index is 1 and isAuthenticated', (tester) async {
        when(
          () => authenticationState.status,
        ).thenReturn(
          AuthenticationStatus.authenticated,
        );
        const index = 1;
        when(() => shell.currentIndex).thenReturn(index);
        when(() => shell.goBranch(index)).thenAnswer((_) async {});
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onDestinationSelected?.call(index);
        final scaffoldState = tester.state<_MockScaffoldState>(
          find.byType(_MockScaffold),
        );
        verify(() => shell.goBranch(index)).called(1);
        expect(scaffoldState.calledCloseDrawer, true);
      });
    });

    testWidgets('renders $CurrentVersion', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(CurrentVersion), findsOneWidget);
    });
  });
}
