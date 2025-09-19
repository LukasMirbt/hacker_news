import 'package:app/feed/feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    return AppPaginatedList(
      hasReachedMax: hasReachedMax,
      isLoading: isLoading,
      itemCount: items.length,
      itemBuilder: builder.itemBuilder,
      skeletonBuilder: (context, index) {
        return Skeletonizer(
          child: Column(
            children: [
              PostFeedItem(
                PostFeedItemModelPlaceholder(index),
              ),
              const Divider(height: 0),
            ],
          ),
        );
      },
      onBottomReached: () {
        context.read<FeedBloc>().add(
          const FeedDataFetched(),
        );
      },
    );
  }
}
