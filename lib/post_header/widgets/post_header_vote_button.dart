import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/post_header/post_header.dart';

class PostHeaderVoteButton extends StatelessWidget {
  const PostHeaderVoteButton({
    required this.score,
    super.key,
  });

  final String score;

  @override
  Widget build(BuildContext context) {
    final hasBeenUpvoted = context.select(
      (PostHeaderBloc bloc) => bloc.state.header.hasBeenUpvoted,
    );

    return AppPostHeaderVoteButton(
      data: AppPostHeaderVoteButtonData(
        score: score,
        hasBeenUpvoted: hasBeenUpvoted,
        onPressed: () {
          context.read<PostHeaderBloc>().add(
            const PostHeaderVotePressed(),
          );
        },
      ),
    );
  }
}
