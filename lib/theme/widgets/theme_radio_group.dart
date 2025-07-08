import 'package:flutter/material.dart';
import 'package:hacker_client/theme/theme.dart';

class ThemeRadioGroup extends StatelessWidget {
  const ThemeRadioGroup({super.key});

  @visibleForTesting
  static const modes = [
    ThemeMode.light,
    ThemeMode.dark,
    ThemeMode.system,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final mode in modes) ThemeRadioOption(mode),
      ],
    );
  }
}
