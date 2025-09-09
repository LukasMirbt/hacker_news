import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentPadding extends StatelessWidget {
  const CommentPadding({super.key});

  @override
  Widget build(BuildContext context) {
    final isExpanded = context.select(
      (CommentModel comment) => comment.isExpanded,
    );

    if (!isExpanded) return const SizedBox.shrink();

    return const SizedBox(
      width: double.infinity,
      height: AppSpacing.sm,
    );
  }
}
