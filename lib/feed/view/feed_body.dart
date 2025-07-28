import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hacker_client/feed/feed.dart';
import 'package:provider/provider.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class FeedBody extends StatefulWidget {
  const FeedBody({
    this.builder = const FeedBuilder(),
    super.key,
  });

  final FeedBuilder builder;

  @override
  State<FeedBody> createState() => _FeedBodyState();
}

class _FeedBodyState extends State<FeedBody> {
  late final ScrollController _controller;
  static const double _scrollThreshold = 20;

  // These two variables work together to manage the threshold logic
  double _scrollAnchor = 0;
  ScrollDirection _lastScrollDirection = ScrollDirection.idle;

  // No changes to _show() or _hide()
  void _show() {
    final isVisible = context.read<bool>();
    if (!isVisible) {
      final setIsVisible = context
          .read<void Function({required bool isVisible})>();
      setIsVisible(isVisible: true);
    }
  }

  void _hide() {
    final isVisible = context.read<bool>();
    if (isVisible) {
      final setIsVisible = context
          .read<void Function({required bool isVisible})>();
      setIsVisible(isVisible: false);
    }
  }

  // This is the corrected listener logic
  void _listen() {
    final currentDirection = _controller.position.userScrollDirection;
    // Do nothing if the scroll direction is idle
    if (currentDirection == ScrollDirection.idle) return;

    // Reset the anchor when the scroll direction changes
    if (currentDirection != _lastScrollDirection) {
      _scrollAnchor = _controller.offset;
    }
    _lastScrollDirection = currentDirection;

    final currentOffset = _controller.offset;
    final isVisible = context.read<bool>();

    // Hiding logic: Scrolling down
    if (currentDirection == ScrollDirection.reverse && isVisible) {
      if (currentOffset - _scrollAnchor > _scrollThreshold) {
        _hide();
      }
    }

    // Showing logic: Scrolling up
    if (currentDirection == ScrollDirection.forward && !isVisible) {
      if (_scrollAnchor - currentOffset > _scrollThreshold) {
        _show();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_listen);
  }

  @override
  void dispose() {
    _controller.removeListener(_listen);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasReachedMax = context.select(
      (FeedBloc bloc) => bloc.state.feed.hasReachedMax,
    );

    final isLoading = context.select(
      (FeedBloc bloc) => bloc.state.fetchStatus.isLoading,
    );

    final items = context.select(
      (FeedBloc bloc) => bloc.state.feed.items,
    );

    final padding = widget.builder.padding(
      hasReachedMax: hasReachedMax,
    );

    final topSafeArea = MediaQuery.of(context).padding.top;

    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: InfiniteList(
        scrollController: _controller,
        padding: padding.copyWith(top: 56 + 48 + topSafeArea),
        hasReachedMax: hasReachedMax,
        isLoading: isLoading,
        itemCount: items.length,
        itemBuilder: widget.builder.itemBuilder,
        separatorBuilder: widget.builder.separatorBuilder,
        loadingBuilder: widget.builder.loadingBuilder,
        onFetchData: () {
          context.read<FeedBloc>().add(
            const FeedDataFetched(),
          );
        },
      ),
    );
  }
}
