import 'package:flutter/foundation.dart';

class AppEventFilter {
  const AppEventFilter();

  @visibleForTesting
  static final excludedSuffixes = [
    'SubscriptionRequested',
    'Started',
  ];

  bool isAnalytic(String eventName) {
    for (final suffix in excludedSuffixes) {
      if (eventName.endsWith(suffix)) return false;
    }
    return true;
  }
}
