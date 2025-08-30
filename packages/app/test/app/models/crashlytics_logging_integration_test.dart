// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:app/app/app.dart';
import 'package:app_logging/app_logging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockFirebaseApp extends Mock implements FirebaseApp {}

class _MockFirebaseCrashlytics extends Mock implements FirebaseCrashlytics {}

void main() {
  group(CrashlyticsLoggingIntegration, () {
    late FirebaseApp firebaseApp;
    late FirebaseCrashlytics crashlytics;

    setUp(() {
      firebaseApp = _MockFirebaseApp();
      crashlytics = _MockFirebaseCrashlytics();
    });

    CrashlyticsLoggingIntegration createSubject() {
      return CrashlyticsLoggingIntegration(
        firebaseApp,
        firebaseCrashlytics: crashlytics,
      );
    }

    test('is a $LoggingIntegration', () {
      expect(
        createSubject(),
        isA<LoggingIntegration>(),
      );
    });

    group('log', () {
      const message = 'message';
      final error = Exception('oops');
      final stackTrace = StackTrace.current;

      test('calls crashlytics.recordError '
          'when level >= ${Level.SEVERE}', () {
        final recordError = () => crashlytics.recordError(
          error,
          stackTrace,
          reason: message,
        );
        when(recordError).thenAnswer((_) async {});
        final integration = createSubject();
        integration.log(
          LogRecord(
            Level.SEVERE,
            message,
            'loggerName',
            error,
            stackTrace,
          ),
        );
        verify(recordError).called(1);
      });

      test('calls crashlytics.log '
          'when level < ${Level.SEVERE}', () {
        final log = () => crashlytics.log(
          '$message, error: $error, stackTrace: $stackTrace',
        );
        when(log).thenAnswer((_) async {});
        final integration = createSubject();
        integration.log(
          LogRecord(
            Level.INFO,
            message,
            'loggerName',
            error,
            stackTrace,
          ),
        );
        verify(log).called(1);
      });
    });
  });
}
