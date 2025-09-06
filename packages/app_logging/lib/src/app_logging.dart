import 'package:app_logging/app_logging.dart';

abstract class AppLogging {
  static Logger start({
    required bool debug,
    required List<LoggingIntegration> integrations,
  }) {
    final logger = Logger.root;

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
