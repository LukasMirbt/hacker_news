import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/thread_list/thread_list.dart';

class ThreadListBuilder {
  const ThreadListBuilder();

  EdgeInsets padding({required bool hasReachedMax}) {
    return EdgeInsets.only(
      bottom: hasReachedMax ? 24 : 0,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final state = context.read<ThreadListBloc>().state;
    final items = state.list.visibleItems;
    final item = items[index];
    final isLast = index == items.length - 1;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: item.indent * AppSpacing.md,
          ),
          child: ThreadListItem(item: item),
        ),
        if (isLast) ThreadListFooter(item),
      ],
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    final state = context.read<ThreadListBloc>().state;
    final items = state.list.visibleItems;
    final comment = items[index];
    final nextComment = items[index + 1];

    if (nextComment.isTopLevel) return ThreadTopLevelDivider(comment);
    if (!comment.isExpanded) return const SizedBox.shrink();

    return const SizedBox(height: AppSpacing.sm);
  }

  Widget loadingBuilder(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppSpacing.lg),
      child: PaginationSpinner(),
    );
  }
}
