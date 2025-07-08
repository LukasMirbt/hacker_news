part of '../../app_shell/route/app_stateful_shell_route.dart';

class FeedItemOptionsRoute extends GoRouteData with _$FeedItemOptionsRoute {
  const FeedItemOptionsRoute(this.$extra);

  static const config = TypedGoRoute<FeedItemOptionsRoute>(
    path: 'item/options',
  );

  static final $parentNavigatorKey = AppRouter.navigatorKey;

  final FeedItem $extra;

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return ModalBottomSheetPage(
      showDragHandle: true,
      builder: (_) => FeedItemOptionsSheet(item: $extra),
    );
  }
}
