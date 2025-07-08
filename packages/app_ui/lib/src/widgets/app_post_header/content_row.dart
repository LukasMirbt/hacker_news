import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentRow extends StatelessWidget {
  const ContentRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.xlg,
        right: AppSpacing.xlg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TitleColumn(),
          _HtmlText(
            padding: EdgeInsets.only(top: AppSpacing.lg),
          ),
        ],
      ),
    );
  }
}

class _TitleColumn extends StatelessWidget {
  const _TitleColumn();

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
          _Title(),
          _Subtitle(),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final title = context.select(
      (AppPostHeaderData data) => data.title,
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
      (AppPostHeaderData data) => data.urlHost,
    );

    final user = context.select(
      (AppPostHeaderData data) => data.user,
    );

    final age = context.select(
      (AppPostHeaderData data) => data.age,
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
          if (urlHost.isNotEmpty) ...[
            TextSpan(text: urlHost),
            TextSpan(text: l10n.separator),
          ],
          if (user != null) ...[
            TextSpan(text: user),
            TextSpan(text: l10n.separator),
          ],
          TextSpan(text: age),
        ],
      ),
    );
  }
}

class _HtmlText extends StatelessWidget {
  const _HtmlText({required this.padding});

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final htmlText = context.select(
      (AppPostHeaderData data) => data.htmlText,
    );

    final onTextLinkPressed = context.select(
      (AppPostHeaderData data) => data.onTextLinkPressed,
    );

    if (htmlText == null) return const SizedBox.shrink();

    return Padding(
      padding: padding,
      child: AppHtmlWidget(
        html: htmlText,
        onLinkPressed: onTextLinkPressed,
      ),
    );
  }
}
