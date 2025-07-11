import 'package:analytics_repository/analytics_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';

class SendAnalyticsEventFailure with EquatableMixin implements Exception {
  const SendAnalyticsEventFailure(this.event, this.error);

  final AnalyticsEvent event;
  final Object error;

  @override
  List<Object?> get props => [event, error];
}

class AnalyticsRepository {
  const AnalyticsRepository(
    FirebaseApp _, {
    required FirebaseAnalytics firebaseAnalytics,
    required AnalyticsConsentStorage consentStorage,
  }) : _firebaseAnalytics = firebaseAnalytics,
       _storage = consentStorage;

  final FirebaseAnalytics _firebaseAnalytics;
  final AnalyticsConsentStorage _storage;

  Future<bool> isAnalyticsCollectionEnabled() async {
    final enabled = await _storage.readAnalyticsCollectionEnabled();
    return enabled;
  }

  Future<void> disableAnalyticsCollection() async {
    const enabled = false;
    await _firebaseAnalytics.setAnalyticsCollectionEnabled(enabled);
    await _storage.writeAnalyticsCollectionEnabled(enabled: enabled);
  }

  Future<void> enableAnalyticsCollection() async {
    const enabled = true;
    await _firebaseAnalytics.setAnalyticsCollectionEnabled(enabled);
    await _storage.writeAnalyticsCollectionEnabled(enabled: enabled);
  }

  Future<void> send(AnalyticsEvent event) async {
    try {
      await event.send(_firebaseAnalytics);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SendAnalyticsEventFailure(event, error),
        stackTrace,
      );
    }
  }
}
