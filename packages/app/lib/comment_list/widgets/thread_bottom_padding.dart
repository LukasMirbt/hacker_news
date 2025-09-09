import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThreadBottomPadding extends StatelessWidget {
  const ThreadBottomPadding({super.key});

  @override
  Widget build(BuildContext context) {
    final isExpanded = context.select(
      (CommentModel comment) => comment.isExpanded,
    );

    return CommentIndent(
      child: CommentBackground(
        child: SizedBox(
          width: double.infinity,
          height: isExpanded ? AppSpacing.sm : AppSpacing.xs,
        ),
      ),
    );
  }
}
