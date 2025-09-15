import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ThreadCommentListSpinner extends StatelessWidget {
  const ThreadCommentListSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppSpacing.lg),
      child: PaginationSpinner(),
    );
  }
}
