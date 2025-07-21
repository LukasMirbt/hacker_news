part of '../../app_shell/route/app_stateful_shell_route.dart';

class ThreadItemOptionsRoute extends GoRouteData with _$ThreadItemOptionsRoute {
  const ThreadItemOptionsRoute({
    required this.$extra,
  });

  static final $parentNavigatorKey = AppRouterState.navigatorKey;

  static const config = TypedGoRoute<ThreadItemOptionsRoute>(
    path: 'item/options',
  );

  final ThreadFeedItem $extra;

  @override
  Page<void> buildPage(
    BuildContext context,
    GoRouterState state,
  ) {
    return ModalBottomSheetPage(
      showDragHandle: true,
      builder: (_) => ThreadItemOptionsSheet(item: $extra),
    );
  }
}
