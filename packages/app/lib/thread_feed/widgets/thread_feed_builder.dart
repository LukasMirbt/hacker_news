import 'package:app/thread_feed/thread_feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThreadFeedBuilder {
  const ThreadFeedBuilder();

  EdgeInsets padding({required bool hasReachedMax}) {
    return EdgeInsets.only(
      bottom: hasReachedMax ? 24 : 0,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final state = context.read<ThreadFeedBloc>().state;
    final items = state.feed.visibleItems;
    final comment = items[index];
    final isLast = index == items.length - 1;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: comment.indent * AppSpacing.md,
          ),
          child: ThreadComment(comment),
        ),
        if (isLast) ThreadFeedFooter(comment),
      ],
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    final state = context.read<ThreadFeedBloc>().state;
    final items = state.feed.visibleItems;
    final comment = items[index];
    final nextComment = items[index + 1];

    if (nextComment.isTopLevel) return ThreadFeedTopLevelDivider(comment);
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
