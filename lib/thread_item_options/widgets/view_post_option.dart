import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/thread_item_options/thread_item_options.dart';

class ViewPostOption extends StatelessWidget {
  const ViewPostOption({super.key});

  @override
  Widget build(BuildContext context) {
    final postId = context.select(
      (ThreadItemOptionsBloc bloc) => bloc.state.item.postId,
    );

    if (postId == null) return const SizedBox.shrink();

    return ViewPostOptionBody(postId: postId);
  }
}
