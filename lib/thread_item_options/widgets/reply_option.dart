import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/thread_item_options/thread_item_options.dart';

class ReplyOption extends StatelessWidget {
  const ReplyOption({super.key});

  @override
  Widget build(BuildContext context) {
    final replyUrl = context.select(
      (ThreadItemOptionsBloc bloc) => bloc.state.item.replyUrl,
    );

    if (replyUrl == null) return const SizedBox.shrink();

    return ReplyOptionBody(url: replyUrl);
  }
}
