import 'package:app/thread_feed/thread_feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThreadFeedBody extends StatelessWidget {
  const ThreadFeedBody({super.key});

  Widget containerBuilder(_, ItemBuilder itemBuilder) {
    return ThreadCommentList(itemBuilder);
  }

  Widget commentBuilder(_, int index) {
    return ThreadComment(index);
  }

  @override
  Widget build(BuildContext context) {
    final visibleItems = context.select(
      (ThreadFeedBloc bloc) => bloc.state.feed.visibleItems,
    );

    return AppCommentList(
      data: AppCommentListData(
        items: visibleItems,
        containerBuilder: containerBuilder,
        commentBuilder: commentBuilder,
      ),
    );
  }
}
