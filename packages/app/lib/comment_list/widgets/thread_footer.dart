import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThreadFooter extends StatelessWidget {
  const ThreadFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isExpanded = context.select(
      (CommentModel comment) => comment.isExpanded,
    );

    final isTopLevel = context.select(
      (CommentModel comment) => comment.isTopLevel,
    );

    double height;

    if (isExpanded) {
      height = AppSpacing.lg;
    } else if (isTopLevel) {
      height = AppSpacing.xs;
    } else {
      height = AppSpacing.sm;
    }

    return CommentIndent(
      child: CommentBackground(
        child: Container(
          height: height,
        ),
      ),
    );
  }
}
