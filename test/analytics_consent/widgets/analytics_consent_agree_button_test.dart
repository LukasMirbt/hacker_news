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

void main() {
  group(AnalyticsConsentAgreeButton, () {
    late AnalyticsConsentBloc bloc;

    setUp(() {
      bloc = _MockAnalyticsConsentBloc();
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: bloc,
        child: AnalyticsConsentAgreeButton(),
      );
    }

    group(AppFilledButton, () {
      AppFilledButton findWidget(WidgetTester tester) {
        return tester.widget<AppFilledButton>(
          find.byType(AppFilledButton),
        );
      }

      testWidgets('adds $AnalyticsConsentAgreePressed '
          'onPressed', (tester) async {
        await tester.pumpApp(buildSubject());
        final widget = findWidget(tester);
        widget.onPressed?.call();
        verify(
          () => bloc.add(
            AnalyticsConsentAgreePressed(),
          ),
        ).called(1);
      });
    });
  });
}
