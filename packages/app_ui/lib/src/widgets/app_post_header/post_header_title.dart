import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostHeaderTitle extends StatelessWidget {
  const PostHeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final title = context.select(
      (AppPostHeaderData data) => data.title,
    );

    final colorScheme = ColorScheme.of(context);

    final color = context.select(
      (AppPostHeaderData data) => data.titleColor(colorScheme),
    );

    final textTheme = TextTheme.of(context);

    return Text(
      title,
      style: textTheme.titleMedium?.copyWith(
        fontSize: 18,
        color: color,
      ),
    );
  }
}
