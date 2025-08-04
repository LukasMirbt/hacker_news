import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply/reply.dart' hide ReplyParent;
import 'package:reply_repository/reply_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class ReplyPage extends StatelessWidget {
  const ReplyPage({
    required this.url,
    super.key,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final replyRepository = context.read<ReplyRepository>();
        return ReplyBloc(
            url: url,
            replyRepository: replyRepository,
            voteRepository: context.read<VoteRepository>(),
            savedReplyModel: SavedReplyModel(
              replyRepository: replyRepository,
            ),
          )
          ..add(
            const ReplyVoteSubscriptionRequested(),
          )
          ..add(
            const ReplyStarted(),
          );
      },
      child: const ReplyView(),
    );
  }
}
