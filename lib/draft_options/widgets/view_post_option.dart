import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/draft_options/draft_options.dart';

class ViewPostOption extends StatelessWidget {
  const ViewPostOption({super.key});

  @override
  Widget build(BuildContext context) {
    final postId = context.select(
      (DraftOptionsBloc bloc) => bloc.state.draft.postId,
    );

    if (postId == null) return const SizedBox.shrink();

    return ViewPostOptionBody(postId: postId);
  }
}
