part of '../../app_shell/route/app_stateful_shell_route.dart';

class CommentRoute extends GoRouteData
    with _$CommentRoute, AppRelativeRoute, AuthenticatedRoute, EquatableMixin {
  const CommentRoute({required this.$extra});

  final CommentForm $extra;

  static const config = TypedRelativeGoRoute<CommentRoute>(
    path: 'comment',
  );

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      fullscreenDialog: true,
      child: CommentPage(form: $extra),
    );
  }

  @override
  List<Object> get props => [];
}
