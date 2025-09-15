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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () {
            final data = context.read<AppPostHeaderData>();
            data.onPressed();
          },
          child: const PostHeaderTitle(),
        ),
        const SizedBox(height: AppSpacing.sm),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            alignment: Alignment.centerLeft,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {
            final data = context.read<AppPostHeaderData>();
            data.onUserPressed();
          },
          child: Row(
            children: [
              AppIcon(
                Symbols.person_rounded,
                size: 20,
                color: ColorScheme.of(context).onSurfaceVariant,
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  '${user ?? ''} · 5 hours ago',
                  style: TextTheme.of(context).labelMedium?.copyWith(
                    color: ColorScheme.of(context).onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ),

        TextButton(
          onPressed: () {
            final data = context.read<AppPostHeaderData>();
            data.onUrlHostPressed();
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            alignment: Alignment.centerLeft,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Row(
            children: [
              AppIcon(
                Symbols.folder_rounded,
                size: 20,
                color: ColorScheme.of(context).onSurfaceVariant,
              ),
              const SizedBox(width: AppSpacing.sm),
              const Expanded(
                child: PostHeaderSubtitle(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
