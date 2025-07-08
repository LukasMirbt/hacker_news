part of '../../app_shell/route/app_stateful_shell_route.dart';

class PostOptionsRoute extends GoRouteData with _$PostOptionsRoute {
  const PostOptionsRoute({
    required this.postId,
  });

  static const config = TypedGoRoute<PostOptionsRoute>(
    path: 'options',
  );

  final String postId;

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return ModalBottomSheetPage(
      showDragHandle: true,
      builder: (_) => const PostOptionsSheet(),
    );
  }
}
