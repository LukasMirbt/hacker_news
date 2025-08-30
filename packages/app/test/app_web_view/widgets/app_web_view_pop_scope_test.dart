// ignore_for_file: prefer_const_constructors

import 'package:app/app_web_view/app_web_view.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockAppWebViewBloc extends MockBloc<AppWebViewEvent, AppWebViewState>
    implements AppWebViewBloc {}

class _MockAppWebViewState extends Mock implements AppWebViewState {}

class _MockGoRouter extends Mock implements GoRouter {}

void main() {
  final child = Container();

  group(AppWebViewPopScope, () {
    late AppWebViewBloc bloc;
    late AppWebViewState state;
    late GoRouter goRouter;

    setUp(() {
      bloc = _MockAppWebViewBloc();
      state = _MockAppWebViewState();
      goRouter = _MockGoRouter();
      when(() => bloc.state).thenReturn(state);
      when(() => state.canGoBack).thenReturn(false);
      registerFallbackValue(AppWebViewStarted());
    });

    Widget buildSubject() {
      return InheritedGoRouter(
        goRouter: goRouter,
        child: BlocProvider.value(
          value: bloc,
          child: AppWebViewPopScope(
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

        testWidgets('adds $AppWebViewBackPressed when !didPop '
            'and canGoBack', (tester) async {
          when(() => state.canGoBack).thenReturn(true);
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          widget.onPopInvokedWithResult?.call(false, null);
          verify(
            () => bloc.add(
              AppWebViewBackPressed(),
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
