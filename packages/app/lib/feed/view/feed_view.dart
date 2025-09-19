import 'package:app/feed/feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeedRefreshIndicator(
      child: FeedItemPressListener(
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final isFailure = context.select(
      (FeedBloc bloc) => bloc.state.fetchStatus.isFailure,
    );

    final isPlaceholder = context.select(
      (FeedBloc bloc) => bloc.state.feed.isPlaceholder,
    );

    if (isFailure) {
      return const AlwaysScrollable(
        child: AppErrorBody(),
      );
    }

    return Skeletonizer(
      enabled: isPlaceholder,
      child: const FeedBody(),
    );
  }
}
