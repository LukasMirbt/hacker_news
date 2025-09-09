import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CommentPadding extends StatelessWidget {
  const CommentPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: AppSpacing.sm,
    );
  }
}
