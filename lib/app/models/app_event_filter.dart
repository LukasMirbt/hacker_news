import 'package:flutter/foundation.dart';
import 'package:hacker_client/app_router/app_router.dart';

class AppEventFilter {
  const AppEventFilter();

  @visibleForTesting
  static final excludedEvents = [
    AppRouterLocationChanged,
  ];

  @visibleForTesting
  static final excludedSuffixes = [
    'SubscriptionRequested',
    'Started',
  ];

  bool isAnalytic(String eventName) {
    for (final event in excludedEvents) {
      if (event.toString() == eventName) return false;
    }
    for (final suffix in excludedSuffixes) {
      if (eventName.endsWith(suffix)) return false;
    }
    return true;
  }
}
