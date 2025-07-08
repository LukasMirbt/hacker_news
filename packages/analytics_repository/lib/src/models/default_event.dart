import 'package:analytics_repository/analytics_repository.dart';
import 'package:recase/recase.dart';

class DefaultEvent extends AnalyticsEvent {
  const DefaultEvent(this.type);

  final Type type;

  @override
  Future<void> send(FirebaseAnalytics analytics) async {
    final name = ReCase(type.toString()).snakeCase;
    await analytics.logEvent(name: name);
  }
}
