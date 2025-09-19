import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';

class AppPaginatedList extends StatefulWidget {
  const AppPaginatedList({
    required this.hasReachedMax,
    required this.isLoading,
    required this.itemCount,
    required this.onBottomReached,
    required this.itemBuilder,
    required this.skeletonBuilder,
    super.key,
  });

  final bool hasReachedMax;
  final bool isLoading;
  final int itemCount;
  final void Function() onBottomReached;
  final Widget Function(BuildContext, int) skeletonBuilder;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  State<AppPaginatedList> createState() => _AppPaginatedListState();
}

class _AppPaginatedListState extends State<AppPaginatedList> {
  static const int _fetchTriggerOffset = 5;

  bool _fetchHasBeenTriggered = false;

  @override
  void didUpdateWidget(AppPaginatedList oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.itemCount > oldWidget.itemCount) {
      _fetchHasBeenTriggered = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final itemCount = widget.itemCount;

    final effectiveItemCount = widget.hasReachedMax
        ? itemCount
        : itemCount + 100;

    return SuperListView.builder(
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: false,
      itemCount: effectiveItemCount,
      itemBuilder: (context, index) {
        final triggerIndex = itemCount - _fetchTriggerOffset;

        if (index == triggerIndex &&
            !widget.isLoading &&
            !_fetchHasBeenTriggered &&
            !widget.hasReachedMax) {
          _fetchHasBeenTriggered = true;

          WidgetsBinding.instance.addPostFrameCallback((_) {
            widget.onBottomReached();
          });
        }

        if (index >= itemCount) {
          final skeletonIndex = index - itemCount;
          return widget.skeletonBuilder(context, skeletonIndex);
        }

        var item = widget.itemBuilder(context, index);

        if (item != null && index == effectiveItemCount - 1) {
          item = SafeArea(
            top: false,
            left: false,
            right: false,
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.lg),
              child: item,
            ),
          );
        }

        return item;
      },
    );
  }
}
