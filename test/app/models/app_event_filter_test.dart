// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app/app.dart';
import 'package:hacker_client/app_router/bloc/bloc.dart';

void main() {
  final excludedSuffixes = AppEventFilter.excludedSuffixes;
  final excludedEvents = AppEventFilter.excludedEvents;

  group(AppEventFilter, () {
    AppEventFilter createSubject() => AppEventFilter();

    group('excludedEvents', () {
      test('contains correct values', () {
        expect(
          AppEventFilter.excludedEvents,
          [
            AppRouterLocationChanged,
          ],
        );
      });
    });

    group('excludedSuffixes', () {
      test('contains correct values', () {
        expect(
          AppEventFilter.excludedSuffixes,
          [
            'SubscriptionRequested',
            'Started',
          ],
        );
      });
    });

    group('isAnalytic', () {
      test('returns false when excludedEvents contains eventName', () {
        final filter = createSubject();
        final eventName = excludedEvents.first.toString();
        final isAnalytic = filter.isAnalytic(eventName);
        expect(isAnalytic, false);
      });

      test('returns false when eventName ends with excluded suffix', () {
        final filter = createSubject();
        final eventName = 'Feature${excludedSuffixes.first}';
        final isAnalytic = filter.isAnalytic(eventName);
        expect(isAnalytic, false);
      });

      test('returns true when excludedEvents does not contain eventName '
          'and eventName does not end with excluded suffix', () {
        final filter = createSubject();
        const eventName = 'FeatureSubmitted';
        final isAnalytic = filter.isAnalytic(eventName);
        expect(isAnalytic, true);
      });
    });
  });
}
