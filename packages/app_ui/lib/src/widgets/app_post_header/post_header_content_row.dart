import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostHeaderContentRow extends StatelessWidget {
  const PostHeaderContentRow({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select(
      (AppPostHeaderData data) => data.user,
    );

    return InkWell(
      onTap: () {
        final data = context.read<AppPostHeaderData>();
        data.onPressed();
      },
      child: Column(
        spacing: AppSpacing.sm,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /*     const PostHeaderTitle(), */
          const PostHeaderSubtitle(),
          Row(
            spacing: AppSpacing.lg,
            children: [
              Text(
                '367 Points',
                style: TextTheme.of(context).labelMedium?.copyWith(
                  color: ColorScheme.of(context).onSurfaceVariant,
                ),
              ),
              Text(
                '88 Comments',
                style: TextTheme.of(context).labelMedium?.copyWith(
                  color: ColorScheme.of(context).onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
