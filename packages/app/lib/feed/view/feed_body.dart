import 'package:app/feed/feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  @override
  void initState() {
    super.initState();
    print('init state');
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

    return AppPaginatedList(
      padding: widget.builder.padding(
        hasReachedMax: hasReachedMax,
      ),
      items: items,
      hasReachedMax: hasReachedMax,
      isLoading: isLoading,
      itemBuilder: widget.builder.itemBuilder,
      separatorBuilder: widget.builder.separatorBuilder,
      loadingBuilder: widget.builder.loadingBuilder,
      onBottomReached: () {
        context.read<FeedBloc>().add(
          const FeedDataFetched(),
        );
      },
    );

    /*   return InfiniteList(
      padding: widget.builder.padding(
        hasReachedMax: hasReachedMax,
      ),
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
    ); */
  }
}
