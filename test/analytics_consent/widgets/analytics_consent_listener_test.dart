// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';
import 'package:hacker_client/app/app.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockAppBloc extends MockBloc<AppEvent, AppState> implements AppBloc {}

class _MockAnalyticsConsentBloc
    extends MockBloc<AnalyticsConsentEvent, AnalyticsConsentState>
    implements AnalyticsConsentBloc {}

void main() {
  final child = Container();
  final initialState = AnalyticsConsentState();

  group(AnalyticsConsentListener, () {
    late AppBloc appBloc;
    late AnalyticsConsentBloc analyticsConsentBloc;

    setUp(() {
      appBloc = _MockAppBloc();
      analyticsConsentBloc = _MockAnalyticsConsentBloc();
      when(() => analyticsConsentBloc.state).thenReturn(initialState);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: appBloc,
        child: BlocProvider.value(
          value: analyticsConsentBloc,
          child: AnalyticsConsentListener(
            child: child,
          ),
        ),
      );
    }

    testWidgets(
      'adds $AppAnalyticsConsentCompleted when status changes '
      'to success',
      (tester) async {
        whenListen(
          analyticsConsentBloc,
          initialState: initialState,
          Stream.value(
            initialState.copyWith(
              status: AnalyticsConsentStatus.success,
            ),
          ),
        );
        await tester.pumpApp(buildSubject());
        verify(
          () => appBloc.add(
            AppAnalyticsConsentCompleted(),
          ),
        ).called(1);
      },
    );

    testWidgets('renders child', (tester) async {
      await tester.pumpApp(buildSubject());
      expect(find.byWidget(child), findsOneWidget);
    });
  });
}
