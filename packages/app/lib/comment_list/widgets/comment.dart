import 'package:app/comment_list/comment_list.dart';
import 'package:flutter/material.dart';

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
