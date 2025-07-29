import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/thread_comment_options/thread_comment_options.dart';

class ReplyOption extends StatelessWidget {
  const ReplyOption({super.key});

  @override
  Widget build(BuildContext context) {
    final replyUrl = context.select(
      (ThreadCommentOptionsBloc bloc) => bloc.state.comment.replyUrl,
    );

    if (replyUrl == null) return const SizedBox.shrink();

    return ReplyOptionBody(url: replyUrl);
  }
}
