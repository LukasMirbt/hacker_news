import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/feed/feed.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:vote_repository/vote_repository.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({
    required this.type,
    super.key,
  });

  final FeedType type;

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider(
      create: (context) =>
          FeedBloc(
              type: widget.type,
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
      child: const FeedView(),
    );
  }
}
