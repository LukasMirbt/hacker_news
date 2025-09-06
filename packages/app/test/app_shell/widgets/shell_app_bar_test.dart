// ignore_for_file: prefer_const_constructors

import 'package:app/app_shell/app_shell.dart';
import 'package:app/authentication/authentication.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:authentication_repository/authentication_repository.dart'
    hide AuthenticationState;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class _MockAuthenticationState extends Mock implements AuthenticationState {}

class _MockAppShellModel extends Mock implements AppShellModel {}

class _MockShellAppBarModel extends Mock implements ShellAppBarModel {}

class _MockAppLocalizations extends Mock implements AppLocalizations {}

void main() {
  const title = 'title';

  group(ShellAppBar, () {
    late AuthenticationBloc authenticationBloc;
    late AuthenticationState authenticationState;
    late AppShellModel model;
    late ShellAppBarModel appBar;

    setUp(() {
      authenticationBloc = _MockAuthenticationBloc();
      authenticationState = _MockAuthenticationState();
      model = _MockAppShellModel();
      appBar = _MockShellAppBarModel();
      registerFallbackValue(_MockAppLocalizations());
      when(() => authenticationBloc.state).thenReturn(authenticationState);
      when(() => authenticationState.status).thenReturn(
        AuthenticationStatus.unauthenticated,
      );
      when(() => model.appBar).thenReturn(appBar);
      when(() => appBar.hasBorder).thenReturn(false);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: authenticationBloc,
        child: Provider.value(
          value: model,
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

      testWidgets('shape is correct when hasBorder', (tester) async {
        when(() => appBar.hasBorder).thenReturn(true);
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

      testWidgets('shape is correct when !hasBorder', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.shape, Border());
      });

      testWidgets('centerTitle is true', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.centerTitle, true);
      });

      testWidgets('has correct title when title is non-null', (tester) async {
        when(() => appBar.title(any())).thenReturn(title);
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(
          widget.title,
          isA<Text>().having(
            (text) => text.data,
            'text',
            title,
          ),
        );
      });

      testWidgets('has correct title when title is null', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.title, isA<Logo>());
      });

      testWidgets('actions contains $UserAvatar '
          'when isAuthenticated', (tester) async {
        when(() => authenticationState.status).thenReturn(
          AuthenticationStatus.authenticated,
        );
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.actions, [isA<UserAvatar>()]);
      });

      testWidgets('actions contains $ShellLoginButton '
          'when !isAuthenticated', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        expect(widget.actions, [isA<ShellLoginButton>()]);
      });
    });
  });
}
