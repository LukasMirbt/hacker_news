import 'package:app/post/post.dart';
import 'package:app/post_header/post_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:post_repository/post_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PostHeaderBloc(
              id: context.read<PostBloc>().state.id,
              postRepository: context.read<PostRepository>(),
              voteRepository: context.read<VoteRepository>(),
              linkLauncher: context.read<LinkLauncher>(),
            )
            ..add(
              const PostHeaderSubscriptionRequested(),
            )
            ..add(
              const PostHeaderVisitedPostSubscriptionRequested(),
            )
            ..add(
              const PostHeaderVoteSubscriptionRequested(),
            ),
      child: const PostHeaderView(),
    );
  }
}
