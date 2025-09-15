import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostHeaderContentRow extends StatelessWidget {
  const PostHeaderContentRow({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final data = context.read<AppPostHeaderData>();
        data.onPressed();
      },
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpacing.md,
        children: [
          PostHeaderTitle(),
          PostHeaderSubtitle(),
        ],
      ),
    );
  }
}
