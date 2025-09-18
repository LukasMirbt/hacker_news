// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:analytics_repository/analytics_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

void main() {
  group(ScreenView, () {
    late FirebaseAnalytics analytics;

    setUp(() {
      analytics = _MockFirebaseAnalytics();
    });

    ScreenView createSubject(String screenName) {
      return ScreenView(screenName);
    }

    group('constructor', () {
      test('throws $AssertionError when screenName.length > 40', () {
        expect(
          () => createSubject('a' * 41),
          throwsA(
            isA<AssertionError>(),
          ),
        );
      });

      test('returns normally when screenName.length <= 40', () {
        expect(
          () => createSubject('a' * 40),
          returnsNormally,
        );
      });
    });

    group('send', () {
      const screenName = 'screenName';

      final logScreenView = () =>
          analytics.logScreenView(screenName: screenName);

      test('calls logScreenView', () {
        when(logScreenView).thenAnswer((_) async {});
        final event = createSubject(screenName);
        event.send(analytics);
        verify(logScreenView).called(1);
      });
    });
  });
}
