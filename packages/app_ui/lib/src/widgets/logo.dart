import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    final textTheme = TextTheme.of(context);

    return Text(
      'HN',
      style: textTheme.titleLarge?.copyWith(
        color: colorScheme.primary,
        fontFamily: FontFamily.atHauss,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
