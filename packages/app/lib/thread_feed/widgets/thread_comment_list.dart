import 'package:app/thread_feed/thread_feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    return AppPaginatedList(
      itemCount: itemCount,
      hasReachedMax: hasReachedMax,
      isLoading: isLoading,
      itemBuilder: itemBuilder,
      skeletonBuilder: (context, index) {
        return Skeletonizer(
          child: OtherUserThreadComment(
            PaginatedThreadFeedModelPlaceholder.placeholder(index),
          ),
        );
      },
      onBottomReached: () {
        context.read<ThreadFeedBloc>().add(
          const ThreadFeedDataFetched(),
        );
      },
    );
  }
}
