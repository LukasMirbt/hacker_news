part of '../../login/route/login_route.dart';

class CreateAccountRoute extends GoRouteData with _$CreateAccountRoute {
  const CreateAccountRoute({required this.from});

  static const config = TypedGoRoute<CreateAccountRoute>(
    path: 'create-account',
  );

  final String from;

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return CreateAccountPage(from: from);
  }
}
