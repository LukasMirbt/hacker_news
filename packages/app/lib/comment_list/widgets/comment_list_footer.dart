import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CommentListFooter extends StatelessWidget {
  const CommentListFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: AppSpacing.lg),
        SafeArea(child: SizedBox.shrink()),
      ],
    );
  }
}
