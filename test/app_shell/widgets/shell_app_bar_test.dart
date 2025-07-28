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

    group(AppBar, () {
      AppBar findWidget(WidgetTester tester) {
        return tester.widget<AppBar>(
          find.byType(AppBar),
        );
      }

      testWidgets('leading is $UserAvatar '
          'when isAuthenticated', (tester) async {
        when(() => authenticationState.status).thenReturn(
          AuthenticationStatus.authenticated,
        );
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.leading, isA<UserAvatar>());
      });

      testWidgets('leading is null when !isAuthenticated', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.leading, null);
      });

      testWidgets('centerTitle is true', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.centerTitle, true);
      });

      testWidgets('has correct title when currentIndex is 1', (tester) async {
        when(() => shell.currentIndex).thenReturn(1);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.title,
          isA<Text>().having(
            (text) => text.data,
            'text',
            l10n.appShell_threads,
          ),
        );
      });

      testWidgets('has correct title when currentIndex is 2', (tester) async {
        when(() => shell.currentIndex).thenReturn(2);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.title,
          isA<Text>().having(
            (text) => text.data,
            'text',
            l10n.appShell_settings,
          ),
        );
      });

      testWidgets('has correct title when currentIndex '
          'is not 1 or 2', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.title, isA<Logo>());
      });

      testWidgets('shape is null when isHome', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.shape, null);
      });

      testWidgets('shape is correct when !isHome', (tester) async {
        when(() => shell.currentIndex).thenReturn(1);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        final context = tester.element(
          find.byWidget(widget),
        );
        final colorScheme = ColorScheme.of(context);
        expect(
          widget.shape,
          Border(
            bottom: BorderSide(
              color: colorScheme.outlineVariant,
            ),
          ),
        );
      });

      testWidgets('shape is correct when isHome', (tester) async {
        when(() => shell.currentIndex).thenReturn(0);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.shape, Border());
      });

      testWidgets('actions contains $LoginButton '
          'when !isAuthenticated', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.actions,
          contains(
            isA<LoginButton>(),
          ),
        );
      });

      testWidgets('actions is empty when isAuthenticated', (tester) async {
        when(() => authenticationState.status).thenReturn(
          AuthenticationStatus.authenticated,
        );
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.actions, <Widget>[]);
      });
    });
  });
}
