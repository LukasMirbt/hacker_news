import 'package:flutter/material.dart';
import 'package:hacker_client/thread_list/thread_list.dart';
import 'package:provider/provider.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class ThreadListBody extends StatelessWidget {
  const ThreadListBody({
    required this.builder,
    super.key,
  });

  final ThreadListBuilder builder;

  @override
  Widget build(BuildContext context) {
    final hasReachedMax = context.select(
      (ThreadListBloc bloc) => bloc.state.list.hasReachedMax,
    );

    final isLoading = context.select(
      (ThreadListBloc bloc) => bloc.state.fetchStatus.isLoading,
    );

    final visibleItems = context.select(
      (ThreadListBloc bloc) => bloc.state.list.visibleItems,
    );

    return Column(
      children: [
        const Divider(height: 1),
        Expanded(
          child: InfiniteList(
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
              context.read<ThreadListBloc>().add(
                const ThreadListBottomReached(),
              );
            },
          ),
        ),
      ],
    );
  }
}
