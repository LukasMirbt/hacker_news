import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/thread_item_options/thread_item_options.dart';

class ContextOption extends StatelessWidget {
  const ContextOption({super.key});

  @override
  Widget build(BuildContext context) {
    final postId = context.select(
      (ThreadItemOptionsBloc bloc) => bloc.state.item.postId,
    );

    // TODO: Context url redirects to post id with comment id fragment.

    // TODO: Make request to fetch postId and commentId

    // TODO: Support commentId parameter in PostRoute

    // TODO: When commenting or replying, listen to state commentId and scroll to comment when it changes.

    // TODO: Highlight comment matching commentId in state.

    if (postId == null) return const SizedBox.shrink();

    return ContextOptionBody(postId: postId);
  }
}
