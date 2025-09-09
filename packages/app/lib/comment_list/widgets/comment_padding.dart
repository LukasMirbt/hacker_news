import 'package:app/comment_list/comment_list.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CommentPadding extends StatelessWidget {
  const CommentPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return CommentIndent(
      child: CommentBackground(
        child: Container(height: AppSpacing.sm),
      ),
    );
  }
}
