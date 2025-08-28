import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppWebViewCloseButton extends StatelessWidget {
  const AppWebViewCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const AppIcon(Symbols.close_rounded),
      onPressed: () {
        GoRouter.of(context).pop();
      },
    );
  }
}
