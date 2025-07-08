import 'package:flutter/material.dart';

enum AppButtonSize {
  shrink,
  expand;

  Size get value {
    switch (this) {
      case AppButtonSize.shrink:
        return const Size(0, 40);
      case AppButtonSize.expand:
        return const Size(double.infinity, 40);
    }
  }
}
