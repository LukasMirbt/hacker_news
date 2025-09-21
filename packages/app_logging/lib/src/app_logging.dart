import 'package:app_logging/app_logging.dart';

abstract class AppLogging {
  static Logger start({
    required bool debug,
    required List<LoggingIntegration> integrations,
  }) {
    hierarchicalLoggingEnabled = true;

    // Use detached logger to prevent other packages
    // from adding noise or logging more often than expected.
    final logger = Logger.detached('app_logging');

    if (debug) {
      logger.level = Level.INFO;
    } else {
      logger.level = Level.FINE;
    }

    logger.onRecord.listen(
      (record) {
        for (final integration in integrations) {
          integration.log(record);
        }
      },
    );

    return logger;
  }
}
