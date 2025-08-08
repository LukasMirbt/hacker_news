part of '../../app_shell/route/app_stateful_shell_route.dart';

class CommentRoute extends RelativeGoRouteData
    with _$CommentRoute, AuthenticatedRoute, EquatableMixin {
  const CommentRoute();

  static const config = TypedRelativeGoRoute<CommentRoute>(
    path: 'comment',
  );

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const CommentPage();
  }

  @override
  List<Object> get props => [];
}
