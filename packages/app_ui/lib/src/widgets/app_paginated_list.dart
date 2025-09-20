import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';

class AppPaginatedList extends StatefulWidget {
  const AppPaginatedList.builder({
    required this.itemCount,
    required this.isLoading,
    required this.hasReachedMax,
    required this.itemBuilder,
    required this.placeholderBuilder,
    required this.footerBuilder,
    required this.onBottomReached,
    super.key,
  }) : separatorBuilder = null;

  const AppPaginatedList.separated({
    required this.itemCount,
    required this.isLoading,
    required this.hasReachedMax,
    required this.itemBuilder,
    required this.separatorBuilder,
    required this.placeholderBuilder,
    required this.footerBuilder,
    required this.onBottomReached,
    super.key,
  });

  final bool hasReachedMax;
  final bool isLoading;
  final int itemCount;
  final void Function() onBottomReached;
  final Widget Function(BuildContext, int) placeholderBuilder;
  final Widget? Function(BuildContext, int) itemBuilder;
  final Widget Function(BuildContext) footerBuilder;
  final Widget Function(BuildContext, int)? separatorBuilder;

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

  Widget? buildItem({
    required int index,
    required int itemCount,
    required int effectiveItemCount,
  }) {
    final triggerIndex = itemCount - _fetchTriggerOffset;

    if (index >= triggerIndex &&
        !widget.isLoading &&
        !_fetchHasBeenTriggered &&
        !widget.hasReachedMax) {
      _fetchHasBeenTriggered = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onBottomReached();
      });
    }

    if (index < itemCount) {
      return widget.itemBuilder(context, index);
    }

    if (widget.hasReachedMax) {
      return widget.footerBuilder(context);
    }

    final skeletonIndex = index - itemCount;

    return Skeletonizer(
      child: widget.placeholderBuilder(context, skeletonIndex),
    );
  }

  @override
  Widget build(BuildContext context) {
    final itemCount = widget.itemCount;
    final separatorBuilder = widget.separatorBuilder;

    final effectiveItemCount = widget.hasReachedMax
        ? itemCount + 1
        : itemCount + 100;

    if (separatorBuilder != null) {
      return SuperListView.separated(
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        itemCount: effectiveItemCount,
        separatorBuilder: separatorBuilder,
        itemBuilder: (context, index) {
          return buildItem(
            index: index,
            itemCount: itemCount,
            effectiveItemCount: effectiveItemCount,
          );
        },
      );
    } else {
      return SuperListView.builder(
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        itemCount: effectiveItemCount,
        itemBuilder: (context, index) {
          return buildItem(
            index: index,
            itemCount: itemCount,
            effectiveItemCount: effectiveItemCount,
          );
        },
      );
    }
  }
}
