// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class _MockAuthenticationState extends Mock implements AuthenticationState {}

class _MockStatefulNavigationShell extends Mock
    with Diagnosticable
    implements StatefulNavigationShell {}

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group(ShellAppBar, () {
    late AuthenticationBloc authenticationBloc;
    late AuthenticationState authenticationState;
    late StatefulNavigationShell shell;

    setUp(() {
      authenticationBloc = _MockAuthenticationBloc();
      authenticationState = _MockAuthenticationState();
      shell = _MockStatefulNavigationShell();
      when(() => authenticationBloc.state).thenReturn(authenticationState);
      when(() => authenticationState.status).thenReturn(
        AuthenticationStatus.unauthenticated,
      );
      when(() => shell.currentIndex).thenReturn(0);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: authenticationBloc,
        child: Provider.value(
          value: shell,
          child: ShellAppBar(),
        ),
      );
    }

    testWidgets('renders $UserAvatar when isAuthenticated', (tester) async {
      when(() => authenticationState.status).thenReturn(
        AuthenticationStatus.authenticated,
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(UserAvatar), findsOneWidget);
    });

    testWidgets('does not render $UserAvatar '
        'when !isAuthenticated', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(UserAvatar), findsNothing);
    });

    testWidgets('centerTitle is true', (tester) async {
      await tester.pumpApp(buildSubject());
      final widget = tester.widget<AppBar>(
        find.byType(AppBar),
      );
      expect(widget.centerTitle, true);
    });

    testWidgets('renders $Logo when currentIndex is 0', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(Logo), findsOneWidget);
    });

    testWidgets('renders correct title when currentIndex is 1', (tester) async {
      when(() => shell.currentIndex).thenReturn(1);
      await tester.pumpApp(buildSubject());
      expect(
        find.text(l10n.appShell_threads),
        findsOneWidget,
      );
    });

    testWidgets('renders correct title when currentIndex is 2', (tester) async {
      when(() => shell.currentIndex).thenReturn(2);
      await tester.pumpApp(buildSubject());
      expect(
        find.text(l10n.appShell_settings),
        findsOneWidget,
      );
    });

    testWidgets('renders $LoginButton when !isAuthenticated', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(LoginButton), findsOneWidget);
    });

    testWidgets('does not render $LoginButton when isAuthenticated', (
      tester,
    ) async {
      when(() => authenticationState.status).thenReturn(
        AuthenticationStatus.authenticated,
      );
      await tester.pumpApp(buildSubject());
      expect(find.byType(LoginButton), findsNothing);
    });
  });
}
