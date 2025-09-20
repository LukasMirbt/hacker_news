import 'package:app/feed/feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedBody extends StatelessWidget {
  const FeedBody({super.key});

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

    return AppPaginatedList.separated(
      hasReachedMax: hasReachedMax,
      isLoading: isLoading,
      itemCount: items.length,
      itemBuilder: (_, index) => FeedItem(index),
      separatorBuilder: (_, _) => const FeedSeparator(),
      placeholderBuilder: (_, index) => FeedPlaceholderItem(index),
      footerBuilder: (_) => const FeedFooter(),
      onBottomReached: () {
        context.read<FeedBloc>().add(
          const FeedDataFetched(),
        );
      },
    );
  }
}
