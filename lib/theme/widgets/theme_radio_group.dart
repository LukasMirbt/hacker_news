import 'package:flutter/material.dart';
import 'package:hacker_client/theme/theme.dart';

class ThemeRadioGroup extends StatelessWidget {
  const ThemeRadioGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final mode in ThemeMode.values) ThemeRadioOption(mode),
      ],
    );
  }
}
