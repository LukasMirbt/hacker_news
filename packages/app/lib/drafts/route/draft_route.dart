part of '../../app_shell/route/app_stateful_shell_route.dart';

class DraftRoute extends GoRouteData
    with _$DraftRoute, AuthenticatedRoute, EquatableMixin {
  const DraftRoute();

  static const config = TypedGoRoute<DraftRoute>(
    path: '/drafts',
    routes: [
      ReplyRoute.config,
      PostShellRoute.config,
    ],
  );

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DraftPage();
  }

  @override
  List<Object> get props => [];
}
