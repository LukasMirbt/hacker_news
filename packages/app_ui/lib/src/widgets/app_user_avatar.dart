import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class AppUserAvatar extends StatelessWidget {
  const AppUserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    return CircleAvatar(
      foregroundColor: colorScheme.onSecondaryContainer,
      backgroundColor: colorScheme.secondaryContainer,
      radius: 14,
      child: const Icon(
        Symbols.person,
        fill: 1,
        size: 16,
        opticalSize: 20,
      ),
    );
  }
}
