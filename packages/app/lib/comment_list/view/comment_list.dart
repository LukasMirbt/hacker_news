import 'package:app/comment_list/comment_list.dart';
import 'package:app/post/post.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_launcher/link_launcher.dart';
import 'package:post_repository/post_repository.dart';
import 'package:post_search_repository/post_search_repository.dart';
import 'package:reply_repository/reply_repository.dart';
import 'package:vote_repository/vote_repository.dart';

class CommentList extends StatelessWidget {
  const CommentList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CommentListBloc(
              id: context.read<PostBloc>().state.id,
              postRepository: context.read<PostRepository>(),
              voteRepository: context.read<VoteRepository>(),
              replyRepository: context.read<ReplyRepository>(),
              postSearchRepository: context.read<PostSearchRepository>(),
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
            )
            ..add(
              const CommentListSelectedCommentSubscriptionRequested(),
            ),
      child: const CommentListView(),
    );
  }
}
