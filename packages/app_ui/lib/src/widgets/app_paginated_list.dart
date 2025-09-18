import 'package:flutter/widgets.dart';

class AppPaginatedList<T> extends StatefulWidget {
  const AppPaginatedList({
    required this.hasReachedMax,
    required this.isLoading,
    required this.items,
    required this.onBottomReached,
    required this.itemBuilder,
    required this.separatorBuilder,
    required this.loadingBuilder,
    this.headerBuilder,
    this.padding,
    super.key,
  });

  final bool hasReachedMax;
  final bool isLoading;
  final List<T> items;
  final void Function() onBottomReached;
  final Widget Function(BuildContext, int) separatorBuilder;
  final Widget Function(BuildContext) loadingBuilder;
  final Widget? Function(BuildContext, int) itemBuilder;
  final Widget Function(BuildContext)? headerBuilder;
  final EdgeInsets? padding;

  @override
  State<AppPaginatedList<T>> createState() => AppPaginatedListState();
}

class AppPaginatedListState<T> extends State<AppPaginatedList<T>> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      widget.onBottomReached();
    }
  }

  bool get _isBottom {
    if (!_controller.hasClients) return false;
    final hasReachedMax = widget.hasReachedMax;
    final isLoading = widget.isLoading;
    if (isLoading || hasReachedMax) return false;
    final maxScroll = _controller.position.maxScrollExtent;
    final currentScroll = _controller.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _controller,
      padding: widget.padding,
      itemCount: widget.hasReachedMax
          ? widget.items.length + 1
          : widget.items.length + 2,
      separatorBuilder: (context, index) {
        if (index == 0) return const SizedBox.shrink();
        index -= 1;
        if (index == widget.items.length - 1) return const SizedBox.shrink();
        return widget.separatorBuilder(context, index);
      },
      itemBuilder: (context, index) {
        if (index == 0) {
          final header = widget.headerBuilder?.call(context);
          return header ?? const SizedBox.shrink();
        }
        index -= 1;
        final items = widget.items;
        final length = items.length;
        if (index == length) return widget.loadingBuilder(context);
        return widget.itemBuilder(context, index);
      },
    );
  }
}
