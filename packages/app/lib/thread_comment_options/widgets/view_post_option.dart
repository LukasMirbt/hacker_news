import 'package:app/thread_comment_options/thread_comment_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewPostOption extends StatelessWidget {
  const ViewPostOption({super.key});

  @override
  Widget build(BuildContext context) {
    final postId = context.select(
      (ThreadCommentOptionsBloc bloc) => bloc.state.comment.postId,
    );

    if (postId == null) return const SizedBox.shrink();

    return ViewPostOptionBody(postId: postId);
  }
}
