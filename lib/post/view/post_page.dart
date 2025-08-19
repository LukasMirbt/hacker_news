import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_list/comment_list.dart';
import 'package:hacker_client/post/post.dart';
import 'package:hacker_client/post_header/post_header.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:post_repository/post_repository.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class PostPage extends StatelessWidget {
  const PostPage({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PostBloc(
                  id: id,
                  postRepository: context.read<PostRepository>(),
                )
                ..add(
                  const PostSubscriptionRequested(),
                )
                ..add(
                  const PostStarted(),
                ),
        ),
        BlocProvider(
          create: (context) =>
              PostHeaderBloc(
                  id: id,
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
        ),
        BlocProvider(
          create: (context) =>
              CommentListBloc(
                  id: id,
                  postRepository: context.read<PostRepository>(),
                  voteRepository: context.read<VoteRepository>(),
                  replyRepository: context.read<ReplyRepository>(),
                  linkLauncher: context.read<LinkLauncher>(),
                )
                ..add(
                  const CommentListSubscriptionRequested(),
                )
                ..add(
                  const CommentListVoteSubscriptionRequested(),
                )
                ..add(
                  const CommentListReplySubscriptionRequested(),
                ),
        ),
      ],
      child: const PostView(),
    );
  }
}
