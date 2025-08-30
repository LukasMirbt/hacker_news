// ignore_for_file: prefer_const_constructors

import 'package:app_logging/app_logging.dart';
import 'package:flutter_test/flutter_test.dart';

class _TestLoggingIntegration extends LoggingIntegration {
  const _TestLoggingIntegration();

  @override
  void log(LogRecord record) {}
}

void main() {
  group(LoggingIntegration, () {
    test('can be extended', () {
      expect(
        _TestLoggingIntegration(),
        isA<LoggingIntegration>(),
      );
    });
  });
}
