import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ThreadFeedView extends StatelessWidget {
  const ThreadFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThreadFeedRefreshIndicator(
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final isFailure = context.select(
      (ThreadFeedBloc bloc) => bloc.state.fetchStatus.isFailure,
    );

    final isPlaceholder = context.select(
      (ThreadFeedBloc bloc) => bloc.state.feed.isPlaceholder,
    );

    final isEmpty = context.select(
      (ThreadFeedBloc bloc) => bloc.state.feed.isEmpty,
    );

    if (isFailure) {
      return const AlwaysScrollable(
        child: AppErrorBody(),
      );
    }

    if (isEmpty) {
      return const AlwaysScrollable(
        child: ThreadFeedEmptyBody(),
      );
    }

    return Skeletonizer(
      enabled: isPlaceholder,
      child: const ThreadFeedBody(),
    );
  }
}
