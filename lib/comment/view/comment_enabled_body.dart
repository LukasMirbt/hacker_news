import 'package:app_ui/app_ui.dart' hide CommentHtml;
import 'package:flutter/material.dart';
import 'package:hacker_client/comment/comment.dart';

class CommentEnabledBody extends StatelessWidget {
  const CommentEnabledBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.lg,
        horizontal: AppSpacing.xlg,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.lg),
              child: CommentTitle(),
            ),
            CommentHtml(
              padding: EdgeInsets.only(bottom: AppSpacing.lg),
            ),
            Divider(height: 1),
            SizedBox(height: AppSpacing.lg),
            Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.lg),
              child: CommentTextField(),
            ),
          ],
        ),
      ),
    );
  }
}
