import 'package:equatable/equatable.dart';

sealed class AppRouterEvent {
  const AppRouterEvent();
}

final class AppRouterLocationChanged extends AppRouterEvent
    with EquatableMixin {
  const AppRouterLocationChanged(this.matchedLocation);

  final String matchedLocation;

  @override
  List<Object> get props => [matchedLocation];
}
