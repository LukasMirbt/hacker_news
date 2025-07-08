import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentRow extends StatelessWidget {
  const ContentRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 48,
          child: Padding(
            padding: EdgeInsets.only(left: 6),
            child: _Rank(),
          ),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(right: AppSpacing.xlg),
            child: _TitleColumn(),
          ),
        ),
      ],
    );
  }
}

class _TitleColumn extends StatelessWidget {
  const _TitleColumn();

  @override
  Widget build(BuildContext context) {
    final onPressed = context.select(
      (AppFeedItemData data) => data.onPressed,
    );

    return InkWell(
      onTap: onPressed,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpacing.sm,
        children: [
          _Title(),
          _Subtitle(),
        ],
      ),
    );
  }
}

class _Rank extends StatelessWidget {
  const _Rank();

  @override
  Widget build(BuildContext context) {
    final rank = context.select(
      (AppFeedItemData data) => data.rank,
    );

    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 24,
        minHeight: 24,
      ),
      child: Center(
        child: FittedBox(
          child: Text(
            rank,
            style: textTheme.titleMedium?.copyWith(
              fontSize: 16,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final title = context.select(
      (AppFeedItemData data) => data.title,
    );

    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    return Text(
      title,
      style: textTheme.titleMedium?.copyWith(
        color: colorScheme.onSurface,
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle();

  @override
  Widget build(BuildContext context) {
    final urlHost = context.select(
      (AppFeedItemData data) => data.urlHost,
    );

    final user = context.select(
      (AppFeedItemData data) => data.user,
    );

    final age = context.select(
      (AppFeedItemData data) => data.age,
    );

    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);
    final l10n = AppUiLocalizations.of(context);

    return Text.rich(
      style: textTheme.labelMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      TextSpan(
        children: [
          if (urlHost != null) ...[
            TextSpan(
              text: urlHost,
            ),
            TextSpan(text: l10n.separator),
          ],
          if (user != null) ...[
            TextSpan(
              text: user,
            ),
            TextSpan(text: l10n.separator),
          ],
          TextSpan(
            text: age,
          ),
        ],
      ),
    );
  }
}
