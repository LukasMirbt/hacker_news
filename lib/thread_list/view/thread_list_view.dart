import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/thread_list/thread_list.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ThreadListView extends StatelessWidget {
  const ThreadListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThreadListRefreshIndicator(
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final isFailure = context.select(
      (ThreadListBloc bloc) => bloc.state.fetchStatus.isFailure,
    );

    final isPlaceholder = context.select(
      (ThreadListBloc bloc) => bloc.state.list.isPlaceholder,
    );

    if (isFailure) {
      return const AlwaysScrollable._(
        child: ErrorText(),
      );
    }

    return Skeletonizer(
      enabled: isPlaceholder,
      child: const ThreadListBody(
        builder: ThreadListBuilder(),
      ),
    );
  }
}

@visibleForTesting
class AlwaysScrollable extends StatelessWidget {
  const AlwaysScrollable._({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: child,
        ),
      ],
    );
  }
}
