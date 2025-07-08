// ignore_for_file: one_member_abstracts

import 'package:firebase_analytics/firebase_analytics.dart';

abstract class AnalyticsEvent {
  const AnalyticsEvent();

  Future<void> send(FirebaseAnalytics analytics);
}
