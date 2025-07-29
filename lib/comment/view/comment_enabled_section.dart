import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/comment/comment.dart';

class CommentEnabledSection extends StatelessWidget {
  const CommentEnabledSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: AppSpacing.lg),
          child: CommentTitle(),
        ),
        CommentHtml(
          padding: EdgeInsets.only(bottom: AppSpacing.lg),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: AppSpacing.lg),
          child: Divider(height: 1),
        ),
        CommentTextField(),
      ],
    );
  }
}
