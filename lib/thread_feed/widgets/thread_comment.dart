import 'package:flutter/material.dart';
import 'package:hacker_client/thread_feed/thread_feed.dart';

class ThreadComment extends StatelessWidget {
  const ThreadComment(this.item, {super.key});

  final ThreadCommentModel item;

  @override
  Widget build(BuildContext context) {
    return switch (item) {
      final CurrentUserThreadCommentModel item => CurrentUserThreadComment(
        item,
      ),
      final OtherUserThreadCommentModel item => OtherUserThreadComment(
        item,
      ),
    };
  }
}
