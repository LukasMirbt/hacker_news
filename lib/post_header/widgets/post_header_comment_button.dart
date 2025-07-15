import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/app_shell/app_shell.dart';
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
          CommentFormRoute(postId: postId).go(context);
        },
      ),
    );
  }
}
