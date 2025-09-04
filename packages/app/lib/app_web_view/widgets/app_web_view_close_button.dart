import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppWebViewCloseButton extends StatelessWidget {
  const AppWebViewCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CloseButton(
      onPressed: () {
        GoRouter.of(context).pop();
      },
    );
  }
}
