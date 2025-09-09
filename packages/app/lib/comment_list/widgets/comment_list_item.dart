import 'package:app/comment_list/comment_list.dart';
import 'package:flutter/material.dart';

class CommentListItem extends StatelessWidget {
  const CommentListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommentIndent(
      child: CommentBackground(
        child: Column(
          children: [
            ThreadTopPadding(),
            Comment(),
            CommentPadding(),
            ThreadBottomPadding(),
          ],
        ),
      ),
    );
  }
}
