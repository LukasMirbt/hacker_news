part of '../../app_shell/route/app_stateful_shell_route.dart';

class FeedItemOptionsRoute extends GoRouteData with _$FeedItemOptionsRoute {
  const FeedItemOptionsRoute({
    required this.$extra,
  });

  static final $parentNavigatorKey = AppRouterState.navigatorKey;

  static const config = TypedGoRoute<FeedItemOptionsRoute>(
    path: 'item/options',
  );

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
