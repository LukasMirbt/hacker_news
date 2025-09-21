// ignore_for_file: cascade_invocations

import 'package:app_logging/app_logging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockLoggingIntegration extends Mock implements LoggingIntegration {}

class _MockLogRecord extends Mock implements LogRecord {}

void main() {
  group(AppLogging, () {
    group('start', () {
      Logger createSubject({
        bool? debug,
        List<LoggingIntegration>? integrations,
      }) {
        return AppLogging.start(
          debug: debug ?? false,
          integrations: integrations ?? [],
        );
      }

      setUp(() {
        registerFallbackValue(_MockLogRecord());
      });

      tearDown(() {
        hierarchicalLoggingEnabled = false;
      });

      test('logger.level is ${Level.INFO} when debug', () {
        final logger = createSubject(debug: true);
        expect(logger.level, Level.INFO);
      });

      test('logger.level is ${Level.FINE} when !debug', () {
        final logger = createSubject(debug: false);
        expect(logger.level, Level.FINE);
      });

      test('calls log for each integration onRecord', () async {
        const level = Level.SEVERE;
        const message = 'message';
        final error = Exception('oops');
        final strackTrace = StackTrace.current;

        final matchesRecord = isA<LogRecord>()
            .having(
              (record) => record.level,
              'level',
              level,
            )
            .having(
              (record) => record.message,
              'message',
              message,
            )
            .having(
              (record) => record.error,
              'error',
              error,
            )
            .having(
              (record) => record.stackTrace,
              'stackTrace',
              strackTrace,
            );

        final firstIntegration = _MockLoggingIntegration();
        final secondIntegration = _MockLoggingIntegration();

        final logger = createSubject(
          integrations: [
            firstIntegration,
            secondIntegration,
          ],
        );

        logger.log(
          level,
          message,
          error,
          strackTrace,
        );

        verify(
          () => firstIntegration.log(
            any(that: matchesRecord),
          ),
        ).called(1);

        verify(
          () => secondIntegration.log(
            any(that: matchesRecord),
          ),
        ).called(1);
      });
    });
  });
}
