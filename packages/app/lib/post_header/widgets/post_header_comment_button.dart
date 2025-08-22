import 'package:app/app_router/app_router.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:app/post_header/post_header.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostHeaderCommentButton extends StatelessWidget {
  const PostHeaderCommentButton({
    required this.commentCount,
    super.key,
  });

  final String commentCount;

  @override
  Widget build(BuildContext context) {
    final isCommentingEnabled = context.select(
      (PostHeaderBloc bloc) => bloc.state.header.isCommentingEnabled,
    );

    return AppPostHeaderCommentButton(
      data: AppPostHeaderCommentButtonData(
        commentCount: commentCount,
        onPressed: !isCommentingEnabled
            ? null
            : () {
                AppRouter.of(context).goRelative(
                  const CommentRoute(),
                );
              },
      ),
    );
  }
}
