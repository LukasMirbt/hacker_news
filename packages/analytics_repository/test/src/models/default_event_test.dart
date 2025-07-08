// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:analytics_repository/analytics_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

class TestEvent {}

void main() {
  group(DefaultEvent, () {
    late FirebaseAnalytics firebaseAnalytics;

    setUp(() {
      firebaseAnalytics = _MockFirebaseAnalytics();
    });

    group('send', () {
      test('calls logEvent', () async {
        final event = DefaultEvent(TestEvent);
        const name = 'test_event';
        final logEvent = () => firebaseAnalytics.logEvent(name: name);
        when(logEvent).thenAnswer((_) async {});
        await event.send(firebaseAnalytics);
        verify(logEvent).called(1);
      });
    });
  });
}
