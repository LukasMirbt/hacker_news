import 'package:flutter/material.dart';
import 'package:hacker_client/comment_list/comment_list.dart';

class Comment extends StatelessWidget {
  const Comment(this.item, {super.key});

  final CommentModel item;

  @override
  Widget build(BuildContext context) {
    return switch (item) {
      final CurrentUserCommentModel item => CurrentUserComment(item),
      final OtherUserCommentModel item => OtherUserComment(item),
    };
  }
}
