// ignore_for_file: cascade_invocations

import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app_logging/app_logging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockLogCallback extends Mock {
  void call(
    String message, {
    DateTime? time,
    int? sequenceNumber,
    int level,
    String name,
    Zone? zone,
    Object? error,
    StackTrace? stackTrace,
  });
}

void main() {
  group(ConsoleLoggingIntegration, () {
    late LogCallback log;

    setUp(() {
      log = _MockLogCallback().call;
    });

    ConsoleLoggingIntegration createSubject() {
      return ConsoleLoggingIntegration(log: log);
    }

    test('is a $LoggingIntegration', () {
      expect(
        createSubject(),
        isA<LoggingIntegration>(),
      );
    });

    group('log', () {
      test('calls log', () {
        final record = LogRecord(
          Level.SEVERE,
          'message',
          'loggerName',
          Exception('oops'),
          StackTrace.current,
        );
        final integration = createSubject();
        integration.log(record);
        verify(
          () => log(
            record.message,
            time: record.time,
            sequenceNumber: record.sequenceNumber,
            level: record.level.value,
            name: record.loggerName,
            zone: record.zone,
            error: record.error,
            stackTrace: record.stackTrace,
          ),
        );
      });
    });
  });
}
