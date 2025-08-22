import 'package:app/comment_options/comment_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReplyOption extends StatelessWidget {
  const ReplyOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final replyUrl = context.select(
      (CommentOptionsBloc bloc) => bloc.state.comment.replyUrl,
    );

    if (replyUrl == null) return const SizedBox.shrink();

    return ReplyOptionBody(url: replyUrl);
  }
}
