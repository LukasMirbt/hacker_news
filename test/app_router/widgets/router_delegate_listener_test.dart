// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nested/nested.dart';

import '../../app/pump_app.dart';

class _MockAppRouterBloc extends MockBloc<AppRouterEvent, AppRouterState>
    implements AppRouterBloc {}

class _MockAppRouterState extends Mock implements AppRouterState {}

class _MockAppRouter extends Mock implements AppRouter {}

class _MockGoRouter extends Mock implements GoRouter {}

class _MockGoRouterDelegate extends Mock implements GoRouterDelegate {}

class _MockGoRouterState extends Mock implements GoRouterState {}

void main() {
  final child = Container();
  const matchedLocation = 'matchedLocation';

  group(RouterDelegateListener, () {
    late AppRouterBloc bloc;
    late AppRouterState state;
    late AppRouter router;
    late GoRouter goRouter;
    late GoRouterDelegate routerDelegate;
    late GoRouterState goRouterState;

    setUp(() {
      bloc = _MockAppRouterBloc();
      state = _MockAppRouterState();
      router = _MockAppRouter();
      goRouter = _MockGoRouter();
      routerDelegate = _MockGoRouterDelegate();
      goRouterState = _MockGoRouterState();
      when(() => bloc.state).thenReturn(state);
      when(() => state.router).thenReturn(router);
      when(() => router.goRouter).thenReturn(goRouter);
      when(() => goRouter.routerDelegate).thenReturn(routerDelegate);
      when(() => routerDelegate.state).thenReturn(goRouterState);
      when(() => goRouterState.matchedLocation).thenReturn(matchedLocation);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: Nested(
          children: [
            RouterDelegateListener(),
          ],
          child: child,
        ),
      );
    }

    testWidgets('adds $AppRouterLocationChanged when routerDelegate listener '
        'is called', (tester) async {
      await tester.pumpApp(buildSubject());
      final listener =
          verify(
                () => routerDelegate.addListener(captureAny()),
              ).captured.single
              as void Function();
      listener();
      verify(
        () => bloc.add(
          AppRouterLocationChanged(matchedLocation),
        ),
      ).called(1);
    });

    testWidgets('renders child', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byWidget(child), findsOneWidget);
    });
  });
}
