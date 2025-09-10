import 'package:app_ui/src/widgets/app_comment_list/app_comment_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentListItem extends StatelessWidget {
  const CommentListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommentIndent(
      child: CommentBackground(
        child: Column(
          children: [
            ThreadTopPadding(),
            _Comment(),
            CommentPadding(),
            ThreadBottomPadding(),
          ],
        ),
      ),
    );
  }
}

class _Comment extends StatelessWidget {
  const _Comment();

  @override
  Widget build(BuildContext context) {
    final commentBuilder = context.select(
      (AppCommentListData data) => data.commentBuilder,
    );

    final index = context.watch<int>();

    return commentBuilder(context, index);
  }
}
