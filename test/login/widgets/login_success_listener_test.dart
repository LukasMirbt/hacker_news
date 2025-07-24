// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/login/login.dart';
import 'package:hacker_client/login_loading/login_loading.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../app/pump_app.dart';

class _MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class _MockAppRouter extends Mock implements AppRouter {}

void main() {
  final child = Container();
  const from = 'from';
  final initialState = LoginState(from: from);

  group(LoginSuccessListener, () {
    late LoginBloc bloc;
    late AppRouter router;

    setUp(() {
      bloc = _MockLoginBloc();
      router = _MockAppRouter();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return Provider.value(
        value: router,
        child: BlocProvider.value(
          value: bloc,
          child: LoginSuccessListener(child: child),
        ),
      );
    }

    testWidgets('navigates to $LoginLoadingRoute when status changes '
        'to success', (tester) async {
      whenListen(
        bloc,
        initialState: initialState,
        Stream.value(
          initialState.copyWith.form(
            status: LoginStatus.success,
          ),
        ),
      );
      await tester.pumpApp(buildSubject());
      verify(
        () => router.go(
          LoginLoadingRoute(from: from),
        ),
      ).called(1);
    });

    testWidgets('renders child', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byWidget(child), findsOneWidget);
    });
  });
}
