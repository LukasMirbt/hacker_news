// ignore_for_file: cascade_invocations

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/app/app.dart';
import 'package:logging/logging.dart';

void main() {
  group(AppLogger, () {
    group('start', () {
      test('returns $Logger', () {
        expect(
          AppLogger.start(),
          isA<Logger>(),
        );
      });
    });

    test('logs records with severity of INFO and higher in debug mode', () {
      final logger = AppLogger.start(debug: true);
      final records = <LogRecord>[];
      final subscription = logger.onRecord.listen(records.add);
      logger.log(Level.INFO, 'message');
      logger.log(Level.FINE, 'message');
      subscription.cancel();
      expect(records.length, 1);
    });

    test('logs records with severity of FINE and higher '
        'when not in debug mode', () {
      final logger = AppLogger.start();
      final records = <LogRecord>[];
      final subscription = logger.onRecord.listen(records.add);
      logger.log(Level.INFO, 'message');
      logger.log(Level.FINE, 'message');
      subscription.cancel();
      expect(records.length, 2);
    });
  });
}
