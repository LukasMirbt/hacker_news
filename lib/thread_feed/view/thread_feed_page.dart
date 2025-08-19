import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:thread_repository/thread_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class ThreadFeedPage extends StatelessWidget {
  const ThreadFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ThreadFeedBloc(
              threadRepository: context.read<ThreadRepository>(),
              authenticationRepository: context
                  .read<AuthenticationRepository>(),
              voteRepository: context.read<VoteRepository>(),
              replyRepository: context.read<ReplyRepository>(),
              linkLauncher: context.read<LinkLauncher>(),
            )
            ..add(
              const ThreadFeedVoteSubscriptionRequested(),
            )
            ..add(
              const ThreadFeedReplySubscriptionRequested(),
            )
            ..add(
              const ThreadFeedStarted(),
            ),
      child: const ThreadFeedView(),
    );
  }
}
