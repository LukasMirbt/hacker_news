import 'package:app/thread_feed/thread_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThreadComment extends StatelessWidget {
  const ThreadComment(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    final item = context.select(
      (ThreadFeedBloc bloc) => bloc.state.feed.visibleItems[index],
    );

    return switch (item) {
      final CurrentUserThreadCommentModel item => CurrentUserThreadComment(
        item,
      ),
      final OtherUserThreadCommentModel item => OtherUserThreadComment(
        item,
      ),
    };
  }
}
