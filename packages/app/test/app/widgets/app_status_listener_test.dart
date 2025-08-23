import 'package:app/app/app.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nested/nested.dart';

import '../pump_app.dart';

class _MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

class _MockAppState extends Mock implements AppState {}

class _MockGoRouter extends Mock implements GoRouter {}

void main() {
  group(AppStatusListener, () {
    late AppBloc bloc;
    late GoRouter goRouter;

    setUp(() {
      bloc = _MockAppBloc();
      goRouter = _MockGoRouter();
    });

    Widget buildSubject() {
      return InheritedGoRouter(
        goRouter: goRouter,
        child: BlocProvider.value(
          value: bloc,
          child: Nested(
            children: [
              AppStatusListener(),
            ],
            child: Container(),
          ),
        ),
      );
    }

    testWidgets('calls refresh when status changes', (tester) async {
      final firstState = _MockAppState();
      final secondState = _MockAppState();
      when(() => firstState.status).thenReturn(AppStatus.analyticsConsent);
      when(() => secondState.status).thenReturn(AppStatus.home);
      whenListen(
        bloc,
        initialState: firstState,
        Stream.value(secondState),
      );
      await tester.pumpApp(buildSubject());
      verify(goRouter.refresh).called(1);
    });
  });
}
