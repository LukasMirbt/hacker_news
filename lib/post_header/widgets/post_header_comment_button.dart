import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_router/app_router.dart';
import 'package:hacker_client/post/post.dart';
import 'package:hacker_client/post_header/post_header.dart';

class PostHeaderCommentButton extends StatelessWidget {
  const PostHeaderCommentButton({
    required this.commentCount,
    super.key,
  });

  final String commentCount;

  @override
  Widget build(BuildContext context) {
    return AppPostHeaderCommentButton(
      data: AppPostHeaderCommentButtonData(
        commentCount: commentCount,
        onPressed: () {
          final state = context.read<PostHeaderBloc>().state;
          final postId = state.id;
          context.read<AppRouter>().push(
            CommentFormRoute(postId: postId),
          );
        },
      ),
    );
  }
}
