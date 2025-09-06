import 'package:app_logging/app_logging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashlyticsLoggingIntegration extends LoggingIntegration {
  CrashlyticsLoggingIntegration(
    FirebaseApp _, {
    required FirebaseCrashlytics firebaseCrashlytics,
  }) : _crashlytics = firebaseCrashlytics;

  final FirebaseCrashlytics _crashlytics;

  @override
  void log(LogRecord record) {
    final LogRecord(
      :level,
      :message,
      :error,
      :stackTrace,
    ) = record;

    if (level >= Level.SEVERE) {
      _crashlytics.recordError(
        error,
        stackTrace,
        reason: message,
      );
    } else {
      _crashlytics.log(
        '$message, error: $error, stackTrace: $stackTrace',
      );
    }
  }
}
