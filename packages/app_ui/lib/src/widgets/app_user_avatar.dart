import 'package:flutter/material.dart';

class AppUserAvatar extends StatelessWidget {
  const AppUserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    return CircleAvatar(
      foregroundColor: colorScheme.onSecondaryContainer,
      backgroundColor: colorScheme.secondaryContainer,
      radius: 14,
      child: const Icon(Icons.person, size: 14),
    );
  }
}
