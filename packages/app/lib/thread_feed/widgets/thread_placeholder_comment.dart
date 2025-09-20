import 'package:app/thread_feed/thread_feed.dart';
import 'package:flutter/material.dart';

class ThreadPlaceholderComment extends StatelessWidget {
  const ThreadPlaceholderComment(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return OtherUserThreadComment(
      OtherUserThreadCommentModelPlaceholder(index),
    );
  }
}
