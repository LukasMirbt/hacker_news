import 'package:analytics_repository/analytics_repository.dart';

class ScreenView extends AnalyticsEvent {
  const ScreenView(this.screenName)
    : assert(
        screenName.length <= 40,
        'screenName must be less than or equal to 40 characters',
      );

  final String screenName;

  @override
  Future<void> send(FirebaseAnalytics analytics) async {
    await analytics.logScreenView(screenName: screenName);
  }
}
