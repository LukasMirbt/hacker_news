import 'package:app/feed/feed.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:vote_repository/vote_repository.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({
    required this.type,
    super.key,
  });

  final FeedType type;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FeedBloc(
              type: type,
              feedRepository: context.read<FeedRepository>(),
              voteRepository: context.read<VoteRepository>(),
              linkLauncher: context.read<LinkLauncher>(),
            )
            ..add(
              const FeedVoteSubscriptionRequested(),
            )
            ..add(
              const FeedVisitedPostSubscriptionRequested(),
            )
            ..add(
              const FeedStarted(),
            ),
      child: const FeedBody(),
    );
  }
}
