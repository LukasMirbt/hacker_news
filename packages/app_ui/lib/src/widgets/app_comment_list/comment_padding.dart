import 'package:app_ui/app_ui.dart';
import 'package:app_ui/src/widgets/app_comment_list/app_comment_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentPadding extends StatelessWidget {
  const CommentPadding({super.key});

  @override
  Widget build(BuildContext context) {
    final isExpanded = context.select(
      (AppCommentModel comment) => comment.isExpanded,
    );

    if (!isExpanded) return const SizedBox.shrink();

    return const CommentPaddingBody();
  }
}

class CommentPaddingBody extends StatelessWidget {
  const CommentPaddingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: AppSpacing.sm,
    );
  }
}
