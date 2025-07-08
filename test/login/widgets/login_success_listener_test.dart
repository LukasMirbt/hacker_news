// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/login/login.dart';
import 'package:hacker_client/login_loading/login_loading.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class _MockGoRouter extends Mock implements GoRouter {}

void main() {
  final child = Container();
  const from = 'from';
  final initialState = LoginState(from: from);

  group(LoginSuccessListener, () {
    late LoginBloc bloc;
    late GoRouter router;

    setUp(() {
      bloc = _MockLoginBloc();
      router = _MockGoRouter();
      when(() => bloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: LoginSuccessListener(child: child),
      );
    }

    testWidgets('navigates to $LoginLoadingRoute when status changes '
        'to success', (tester) async {
      whenListen(
        bloc,
        initialState: initialState,
        Stream.value(
          initialState.copyWith(
            status: LoginStatus.success,
          ),
        ),
      );
      await tester.pumpApp(
        buildSubject(),
        router: router,
      );
      final route = LoginLoadingRoute(from: from);
      verify(
        () => router.go(route.location),
      ).called(1);
    });

    testWidgets('renders child', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byWidget(child), findsOneWidget);
    });
  });
}
