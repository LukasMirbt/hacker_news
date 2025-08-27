import 'dart:async';
import 'dart:developer' as developer;

import 'package:app_logging/app_logging.dart';
import 'package:flutter/material.dart';

typedef LogCallback =
    void Function(
      String message, {
      DateTime? time,
      int? sequenceNumber,
      int level,
      String name,
      Zone? zone,
      Object? error,
      StackTrace? stackTrace,
    });

class ConsoleLoggingIntegration extends LoggingIntegration {
  const ConsoleLoggingIntegration({
    @visibleForTesting LogCallback? log,
  }) : _log = log ?? developer.log;

  final LogCallback _log;

  @override
  void log(LogRecord record) {
    _log(
      record.message,
      time: record.time,
      sequenceNumber: record.sequenceNumber,
      level: record.level.value,
      name: record.loggerName,
      zone: record.zone,
      error: record.error,
      stackTrace: record.stackTrace,
    );
  }
}
