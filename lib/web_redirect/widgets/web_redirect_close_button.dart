import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WebRedirectCloseButton extends StatelessWidget {
  const WebRedirectCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.close),
      onPressed: () {
        GoRouter.of(context).pop();
      },
    );
  }
}
