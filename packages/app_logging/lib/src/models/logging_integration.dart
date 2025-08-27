// ignore_for_file: one_member_abstracts

import 'package:logging/logging.dart';

abstract class LoggingIntegration {
  const LoggingIntegration();

  void log(LogRecord record);
}
