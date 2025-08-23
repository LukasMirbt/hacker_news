// ignore_for_file: prefer_const_constructors

import 'package:app/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(AppState, () {
    group('status', () {
      test('returns ${AppStatus.analyticsConsent} '
          'when !isAnalyticsConsentCompleted', () {
        final state = AppState(
          isAnalyticsConsentCompleted: false,
        );
        expect(
          state.status,
          AppStatus.analyticsConsent,
        );
      });

      test('returns ${AppStatus.home} '
          'when isAnalyticsConsentCompleted', () {
        final state = AppState(
          isAnalyticsConsentCompleted: true,
        );
        expect(
          state.status,
          AppStatus.home,
        );
      });
    });
  });
}
