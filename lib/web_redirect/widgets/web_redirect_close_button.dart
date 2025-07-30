import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

class WebRedirectCloseButton extends StatelessWidget {
  const WebRedirectCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Symbols.close),
      onPressed: () {
        GoRouter.of(context).pop();
      },
    );
  }
}
