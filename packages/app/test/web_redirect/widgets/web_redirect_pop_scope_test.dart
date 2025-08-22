// ignore_for_file: prefer_const_constructors

import 'package:app/web_redirect/web_redirect.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockWebRedirectBloc extends MockBloc<WebRedirectEvent, WebRedirectState>
    implements WebRedirectBloc {}

class _MockWebRedirectState extends Mock implements WebRedirectState {}

class _MockGoRouter extends Mock implements GoRouter {}

void main() {
  final child = Container();

  group(WebRedirectPopScope, () {
    late WebRedirectBloc bloc;
    late WebRedirectState state;
    late GoRouter goRouter;

    setUp(() {
      bloc = _MockWebRedirectBloc();
      state = _MockWebRedirectState();
      goRouter = _MockGoRouter();
      when(() => bloc.state).thenReturn(state);
      when(() => state.canGoBack).thenReturn(false);
      registerFallbackValue(WebRedirectStarted());
    });

    Widget buildSubject() {
      return InheritedGoRouter(
        goRouter: goRouter,
        child: BlocProvider.value(
          value: bloc,
          child: WebRedirectPopScope(
            child: child,
          ),
        ),
      );
    }

    group(PopScope<Object>, () {
      PopScope findWidget(WidgetTester tester) {
        return tester.widget<PopScope<Object>>(
          find.byType(PopScope<Object>),
        );
      }

      group('canPop', () {
        testWidgets('is false', (tester) async {
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          expect(widget.canPop, false);
        });
      });

      group('onPopInvokedWithResult', () {
        testWidgets('returns when didPop', (tester) async {
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          widget.onPopInvokedWithResult?.call(true, null);
          verifyNever(() => bloc.add(any()));
          verifyNever(() => goRouter.pop<Object>(any()));
        });

        testWidgets('adds $WebRedirectBackPressed when !didPop '
            'and canGoBack', (tester) async {
          when(() => state.canGoBack).thenReturn(true);
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          widget.onPopInvokedWithResult?.call(false, null);
          verify(
            () => bloc.add(
              WebRedirectBackPressed(),
            ),
          ).called(1);
        });

        testWidgets('pops when !didPop and !canGoBack', (tester) async {
          const result = 'result';
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          widget.onPopInvokedWithResult?.call(false, result);
          verify(() => goRouter.pop<Object>(result)).called(1);
        });
      });

      testWidgets('renders child', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byWidget(child), findsOneWidget);
      });
    });
  });
}
