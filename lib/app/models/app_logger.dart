import 'dart:developer';

import 'package:logging/logging.dart';

abstract class AppLogger {
  static Logger start({bool debug = false}) {
    final logger = Logger.root;

    if (debug) {
      logger.level = Level.INFO;
    } else {
      logger.level = Level.FINE;
    }

    // TODO: Make sure that onRecord is connected to Crashlytics.

    logger.onRecord.listen(
      (record) {
        log(
          record.message,
          error: record.error,
          stackTrace: record.stackTrace,
        );
      },
    );

    return logger;
  }
}
