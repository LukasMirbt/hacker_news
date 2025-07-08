// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class _MockAuthenticationState extends Mock implements AuthenticationState {}

void main() {
  group(ShellAppBar, () {
    late AuthenticationBloc authenticationBloc;
    late AuthenticationState authenticationState;

    setUp(() {
      authenticationBloc = _MockAuthenticationBloc();
      authenticationState = _MockAuthenticationState();
      when(() => authenticationBloc.state).thenReturn(authenticationState);
      when(() => authenticationState.status).thenReturn(
        AuthenticationStatus.unauthenticated,
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: authenticationBloc,
        child: ShellAppBar(),
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

    testWidgets('renders $Logo', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(Logo), findsOneWidget);
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
