import 'package:app/thread_feed/thread_feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart'
    hide ItemBuilder;

class ThreadCommentList extends StatelessWidget {
  const ThreadCommentList(
    this.itemBuilder, {
    super.key,
  });

  final ItemBuilder itemBuilder;

  @override
  Widget build(BuildContext context) {
    final hasReachedMax = context.select(
      (ThreadFeedBloc bloc) => bloc.state.feed.hasReachedMax,
    );

    final isLoading = context.select(
      (ThreadFeedBloc bloc) => bloc.state.fetchStatus.isLoading,
    );

    final itemCount = context.select(
      (ThreadFeedBloc bloc) => bloc.state.feed.visibleItems.length,
    );

    return InfiniteList(
      itemCount: itemCount,
      hasReachedMax: hasReachedMax,
      isLoading: isLoading,
      itemBuilder: itemBuilder,
      loadingBuilder: (_) => const ThreadCommentListSpinner(),
      onFetchData: () {
        context.read<ThreadFeedBloc>().add(
          const ThreadFeedDataFetched(),
        );
      },
    );
  }
}
