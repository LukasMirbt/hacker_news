// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/pump_app.dart';

class _MockAnalyticsConsentBloc
    extends MockBloc<AnalyticsConsentEvent, AnalyticsConsentState>
    implements AnalyticsConsentBloc {}

class _MockAnalyticsConsentState extends Mock
    implements AnalyticsConsentState {}

void main() {
  group(AnalyticsConsentDeclineButton, () {
    late AnalyticsConsentBloc bloc;
    late AnalyticsConsentState state;

    setUp(() {
      bloc = _MockAnalyticsConsentBloc();
      state = _MockAnalyticsConsentState();
      when(() => bloc.state).thenReturn(state);
      when(() => state.isLoading).thenReturn(false);
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: AnalyticsConsentDeclineButton(),
      );
    }

    group(AppOutlinedButton, () {
      AppOutlinedButton findWidget(WidgetTester tester) {
        return tester.widget<AppOutlinedButton>(
          find.byType(AppOutlinedButton),
        );
      }

      group('isLoading', () {
        testWidgets('is true when state.isLoading', (tester) async {
          when(() => state.isLoading).thenReturn(true);
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          expect(widget.isLoading, true);
        });

        testWidgets('is false when !state.isLoading', (tester) async {
          await tester.pumpApp(buildSubject());
          final widget = findWidget(tester);
          expect(widget.isLoading, false);
        });
      });

      testWidgets('adds $AnalyticsConsentDeclinePressed '
          'onPressed', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onPressed?.call();
        verify(
          () => bloc.add(
            AnalyticsConsentDeclinePressed(),
          ),
        ).called(1);
      });
    });
  });
}
