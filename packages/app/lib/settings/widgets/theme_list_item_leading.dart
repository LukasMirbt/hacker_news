import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ThemeListItemLeading extends StatelessWidget {
  const ThemeListItemLeading({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.brightnessOf(context);

    return AppIcon(
      switch (brightness) {
        Brightness.light => Symbols.light_mode_rounded,
        Brightness.dark => Symbols.dark_mode_rounded,
      },
    );
  }
}
