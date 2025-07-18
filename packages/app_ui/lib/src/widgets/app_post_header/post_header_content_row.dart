import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostHeaderContentRow extends StatelessWidget {
  const PostHeaderContentRow({super.key});

  @override
  Widget build(BuildContext context) {
    final onPressed = context.select(
      (AppPostHeaderData data) => data.onPressed,
    );

    return InkWell(
      onTap: onPressed,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpacing.sm,
        children: [
          PostHeaderTitle(),
          PostHeaderSubtitle(),
        ],
      ),
    );
  }
}
