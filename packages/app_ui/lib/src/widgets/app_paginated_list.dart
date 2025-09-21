import 'package:app_ui/app_ui.dart';
import 'package:flutter/widgets.dart';

class AppPaginatedList extends StatefulWidget {
  const AppPaginatedList({
    required this.itemCount,
    required this.isLoading,
    required this.hasReachedMax,
    required this.itemBuilder,
    required this.placeholderBuilder,
    required this.footerBuilder,
    required this.onFetchData,
    this.separatorBuilder,
    super.key,
  });

  final bool hasReachedMax;
  final bool isLoading;
  final int itemCount;
  final void Function() onFetchData;
  final Widget Function(BuildContext, int) placeholderBuilder;
  final Widget? Function(BuildContext, int) itemBuilder;
  final Widget Function(BuildContext) footerBuilder;
  final Widget Function(BuildContext, int)? separatorBuilder;

  @override
  State<AppPaginatedList> createState() => _AppPaginatedListState();
}

class _AppPaginatedListState extends State<AppPaginatedList> {
  static const _fetchTriggerOffset = 5;
  static const _skeletonItemCount = 100;

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
  }) {
    final triggerIndex = itemCount - _fetchTriggerOffset;

    final shouldFetchData =
        index >= triggerIndex &&
        !widget.isLoading &&
        !widget.hasReachedMax &&
        !_fetchHasBeenTriggered;

    if (shouldFetchData) {
      _fetchHasBeenTriggered = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onFetchData();
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
        : itemCount + _skeletonItemCount;

    if (separatorBuilder != null) {
      return ListView.separated(
        itemCount: effectiveItemCount,
        separatorBuilder: separatorBuilder,
        itemBuilder: (context, index) {
          return buildItem(
            index: index,
            itemCount: itemCount,
          );
        },
      );
    } else {
      return ListView.builder(
        itemCount: effectiveItemCount,
        itemBuilder: (context, index) {
          return buildItem(
            index: index,
            itemCount: itemCount,
          );
        },
      );
    }
  }
}
