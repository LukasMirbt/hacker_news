import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/thread_list/thread_list.dart';
import 'package:provider/provider.dart';

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

    final items = context.select(
      (ThreadListBloc bloc) => bloc.state.list.items,
    );

    return AppPaginatedList(
      padding: EdgeInsets.only(
        bottom: hasReachedMax ? 24 : 0,
      ),
      hasReachedMax: hasReachedMax,
      isLoading: isLoading,
      items: items,
      itemBuilder: builder.itemBuilder,
      separatorBuilder: builder.separatorBuilder,
      loadingBuilder: builder.loadingBuilder,
      onBottomReached: () {
        context.read<ThreadListBloc>().add(
          const ThreadListBottomReached(),
        );
      },
    );
  }
}
