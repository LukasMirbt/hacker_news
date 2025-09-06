import 'package:app/thread_feed/thread_feed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class ThreadFeedBody extends StatelessWidget {
  const ThreadFeedBody({
    this.builder = const ThreadFeedBuilder(),
    super.key,
  });

  final ThreadFeedBuilder builder;

  @override
  Widget build(BuildContext context) {
    final hasReachedMax = context.select(
      (ThreadFeedBloc bloc) => bloc.state.feed.hasReachedMax,
    );

    final isLoading = context.select(
      (ThreadFeedBloc bloc) => bloc.state.fetchStatus.isLoading,
    );

    final visibleItems = context.select(
      (ThreadFeedBloc bloc) => bloc.state.feed.visibleItems,
    );

    return InfiniteList(
      padding: builder.padding(
        hasReachedMax: hasReachedMax,
      ),
      hasReachedMax: hasReachedMax,
      isLoading: isLoading,
      itemCount: visibleItems.length,
      itemBuilder: builder.itemBuilder,
      separatorBuilder: builder.separatorBuilder,
      loadingBuilder: builder.loadingBuilder,
      onFetchData: () {
        context.read<ThreadFeedBloc>().add(
          const ThreadFeedDataFetched(),
        );
      },
    );
  }
}
