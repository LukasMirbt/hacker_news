import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/analytics_consent/analytics_consent.dart';

void main() {
  group(AnalyticsConsentState, () {
    AnalyticsConsentState createState({
      required AnalyticsConsentStatus status,
    }) {
      return AnalyticsConsentState(status: status);
    }

    group('isLoading', () {
      test('returns true when status '
          'is ${AnalyticsConsentStatus.initial}', () {
        final state = createState(
          status: AnalyticsConsentStatus.loading,
        );
        expect(state.isLoading, false);
      });

      test('returns true when status '
          'is ${AnalyticsConsentStatus.loading}', () {
        final state = createState(
          status: AnalyticsConsentStatus.loading,
        );
        expect(state.isLoading, true);
      });

      test('returns true when status '
          'is ${AnalyticsConsentStatus.success}', () {
        final state = createState(
          status: AnalyticsConsentStatus.success,
        );
        expect(state.isLoading, false);
      });
    });
  });
}
