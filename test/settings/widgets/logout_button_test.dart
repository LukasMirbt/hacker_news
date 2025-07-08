// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/authentication/authentication.dart';
import 'package:hacker_client/settings/settings.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class _MockAuthenticationState extends Mock implements AuthenticationState {}

void main() {
  group(LogoutButton, () {
    late AuthenticationBloc bloc;
    late AuthenticationState state;

    setUp(() {
      bloc = _MockAuthenticationBloc();
      state = _MockAuthenticationState();
      when(() => bloc.state).thenReturn(state);
      when(() => state.logoutStatus).thenReturn(LogoutStatus.initial);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: LogoutButton(),
      );
    }

    group(AppOutlinedButton, () {
      AppOutlinedButton findWidget(WidgetTester tester) {
        return tester.widget<AppOutlinedButton>(
          find.byType(AppOutlinedButton),
        );
      }

      group('isLoading', () {
        testWidgets('is true when logoutStatus.isLoading', (tester) async {
          when(() => state.logoutStatus).thenReturn(
            LogoutStatus.loading,
          );
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          expect(widget.isLoading, true);
        });

        testWidgets('is false when !logoutStatus.isLoading', (tester) async {
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          expect(widget.isLoading, false);
        });
      });

      testWidgets('adds $AuthenticationLogoutPressed '
          'onPressed', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onPressed?.call();
        verify(
          () => bloc.add(
            AuthenticationLogoutPressed(),
          ),
        );
      });
    });
  });
}
