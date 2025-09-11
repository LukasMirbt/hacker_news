import 'package:app_ui/src/widgets/app_other_user_comment/app_other_user_comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentBody extends StatelessWidget {
  const CommentBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isExpanded = context.select(
      (AppOtherUserCommentData data) => data.isExpanded,
    );

    if (isExpanded) return const ExpandedBody();

    return const CollapsedBody();
  }
}
