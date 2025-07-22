import 'package:go_router/go_router.dart';

abstract interface class AppRoute {
  String get location;

  String from(GoRouter router);

  String get navigationLocation;
}
