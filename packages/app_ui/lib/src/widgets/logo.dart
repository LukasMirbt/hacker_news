import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = ColorScheme.of(context).brightness;

    return switch (brightness) {
      Brightness.light => Assets.images.appIconSmall,
      Brightness.dark => Assets.images.appIconDarkSmall,
    }.image(
      height: 32,
      width: 32,
    );
  }
}
