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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const PostHeaderTitle(),
          const SizedBox(height: AppSpacing.md),

          const PostHeaderSubtitle(),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Text(
                'kafked',
                style: TextTheme.of(context).labelMedium?.copyWith(
                  color: ColorScheme.of(context).onSurfaceVariant,
                ),
              ),
              Text(
                ' · 5 hours ago',
                style: TextTheme.of(context).labelMedium?.copyWith(
                  color: ColorScheme.of(context).onSurfaceVariant,
                ),
              ),
            ],
          ),
          /*         Text(
            '5 hours ago',
            style: TextTheme.of(context).labelMedium?.copyWith(
              color: ColorScheme.of(context).onSurfaceVariant,
            ),
          ), */
        ],
      ),
    );
  }
}
