import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/thread_list/thread_list.dart';

class ThreadListBuilder {
  const ThreadListBuilder();

  Widget separatorBuilder(
    BuildContext context,
    int _,
  ) {
    return const Divider(height: 0);
  }

  Widget itemBuilder(BuildContext context, int index) {
    final items = context.read<ThreadListBloc>().state.list.items;
    final item = items[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (index == 0)
          const SizedBox(
            height: 1,
            child: Divider(height: 0),
          ),
        ThreadListItem(item: item),
      ],
    );
  }

  Widget loadingBuilder(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: PaginationSpinner(),
    );
  }
}
