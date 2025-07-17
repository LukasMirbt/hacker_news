import 'package:flutter/material.dart';
import 'package:hacker_client/feed/feed.dart';
import 'package:provider/provider.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class FeedBody extends StatelessWidget {
  const FeedBody({
    this.builder = const FeedBuilder(),
    super.key,
  });

  final FeedBuilder builder;

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

    return InfiniteList(
      padding: builder.padding(
        hasReachedMax: hasReachedMax,
      ),
      isLoading: isLoading,
      hasReachedMax: hasReachedMax,
      itemCount: items.length,
      onFetchData: () {
        context.read<FeedBloc>().add(
          const FeedBottomReached(),
        );
      },
      itemBuilder: builder.itemBuilder,
      separatorBuilder: builder.separatorBuilder,
      loadingBuilder: builder.loadingBuilder,
    );
    /* 
    return AppPaginatedList(
      padding: builder.padding(
        hasReachedMax: hasReachedMax,
      ),
      hasReachedMax: hasReachedMax,
      isLoading: isLoading,
      items: items,
      itemBuilder: builder.itemBuilder,
      separatorBuilder: builder.separatorBuilder,
      loadingBuilder: builder.loadingBuilder,
      onBottomReached: () {
        context.read<FeedBloc>().add(
          const FeedBottomReached(),
        );
      },
    ); */
  }
}
