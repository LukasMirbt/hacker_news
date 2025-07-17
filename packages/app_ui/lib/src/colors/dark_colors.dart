import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class DarkColors extends AppColors {
  const DarkColors();

  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get primary => const Color(0xFFFF6600);

  @override
  Color get onPrimary => Colors.black;

  @override
  Color get primaryContainer => const Color(0xFF662500);

  @override
  Color get onPrimaryContainer => const Color(0xFFFFDBC8);

  @override
  Color get secondaryContainer => const Color.fromRGBO(40, 40, 40, 1);

  @override
  Color get onSecondaryContainer => const Color.fromARGB(255, 255, 126, 40);

  @override
  Color get tertiary => const Color(0xFFFF8C00);

  @override
  Color get onTertiary => Colors.black;

  @override
  Color get error => const Color(0xFFcf6679);

  @override
  Color get onError => Colors.black;

  @override
  Color get surface => const Color(0xFF121212);

  @override
  Color get onSurface => const Color(0xFFE0E0E0);

  @override
  Color get onSurfaceVariant => const Color(0xFF949494);

  @override
  Color get outline => const Color(0xFF616161);

  @override
  Color get outlineVariant => const Color.fromRGBO(66, 66, 66, 1);

  @override
  Color get surfaceContainerLow => const Color.fromRGBO(30, 30, 30, 1);

  @override
  Color get surfaceContainerHighest => const Color.fromRGBO(30, 30, 30, 1);

  @override
  Color get surfaceTint => const Color.fromRGBO(255, 102, 0, 1);
}
