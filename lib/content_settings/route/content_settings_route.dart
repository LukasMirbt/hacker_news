part of '../../app_shell/route/app_stateful_shell_route.dart';

class ContentSettingsRoute extends GoRouteData
    with _$ContentSettingsRoute, EquatableMixin {
  const ContentSettingsRoute();

  static final $parentNavigatorKey = AppRouter.navigatorKey;

  static const config = TypedGoRoute<ContentSettingsRoute>(
    path: 'content',
  );

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const ContentSettingsPage();
  }

  @override
  List<Object> get props => [];
}
