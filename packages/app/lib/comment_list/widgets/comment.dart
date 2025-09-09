import 'package:app/comment_list/comment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Comment extends StatelessWidget {
  const Comment({super.key});

  @override
  Widget build(BuildContext context) {
    final item = context.watch<CommentModel>();

    return switch (item) {
      final CurrentUserCommentModel item => CurrentUserComment(item),
      final OtherUserCommentModel item => OtherUserComment(item),
    };
  }
}
