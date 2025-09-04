// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:app/app_router/app_router.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:app/authentication/authentication.dart';
import 'package:app/profile/profile.dart';
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

class _MockAppRouter extends Mock implements AppRouter {}

void main() {
  const id = 'id';

  group(UserAvatar, () {
    late AuthenticationBloc authenticationBloc;
    late AuthenticationState authenticationState;
    late AppRouter router;

    setUp(() {
      authenticationBloc = _MockAuthenticationBloc();
      authenticationState = _MockAuthenticationState();
      router = _MockAppRouter();
      when(() => authenticationBloc.state).thenReturn(authenticationState);
      when(() => authenticationState.user).thenReturn(
        UserPlaceholder(id: id),
      );
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: BlocProvider.value(
          value: authenticationBloc,
          child: UserAvatar(),
        ),
      );
    }

    testWidgets('renders $IconButton', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('navigates to $ProfileRoute '
        'when $IconButton is pressed', (tester) async {
      final pushProfile = () => router.push(
        ProfileRoute(id: id),
      );
      when(pushProfile).thenAnswer((_) async => null);
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(IconButton));
      verify(pushProfile).called(1);
    });

    testWidgets('renders $AppUserAvatar', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byType(AppUserAvatar), findsOneWidget);
    });
  });
}
