// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app/analytics/analytics.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nested/nested.dart';

import '../../app/pump_app.dart';

class _MockAnalyticsBloc extends MockBloc<AnalyticsEvent, void>
    implements AnalyticsBloc {}

class _MockGoRouter extends Mock implements GoRouter {}

class _MockGoRouterDelegate extends Mock implements GoRouterDelegate {}

class _MockRouteMatchList extends Mock
    with Diagnosticable
    implements RouteMatchList {}

void main() {
  final child = Container();

  group(RouterDelegateListener, () {
    late AnalyticsBloc bloc;
    late GoRouter goRouter;
    late GoRouterDelegate routerDelegate;
    late RouteMatchList currentConfiguration;

    setUp(() {
      bloc = _MockAnalyticsBloc();
      goRouter = _MockGoRouter();
      routerDelegate = _MockGoRouterDelegate();
      currentConfiguration = _MockRouteMatchList();
      when(() => goRouter.routerDelegate).thenReturn(routerDelegate);
      when(
        () => routerDelegate.currentConfiguration,
      ).thenReturn(currentConfiguration);
    });

    Widget buildSubject() {
      return InheritedGoRouter(
        goRouter: goRouter,
        child: BlocProvider.value(
          value: bloc,
          child: Nested(
            children: [
              RouterDelegateListener(),
            ],
            child: child,
          ),
        ),
      );
    }

    testWidgets('adds $AnalyticsFullPathChanged '
        'when listener is called', (tester) async {
      const fullPath = 'fullPath';
      when(() => currentConfiguration.fullPath).thenReturn(fullPath);
      await tester.pumpApp(buildSubject());
      final listener =
          verify(
                () => routerDelegate.addListener(captureAny()),
              ).captured.single
              as void Function();
      listener();
      verify(
        () => bloc.add(
          AnalyticsFullPathChanged(fullPath),
        ),
      ).called(1);
    });

    testWidgets('renders child', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byWidget(child), findsOneWidget);
    });
  });
}
