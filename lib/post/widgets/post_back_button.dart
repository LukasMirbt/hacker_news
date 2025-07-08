import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostBackButton extends StatelessWidget {
  const PostBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BackButton(
      onPressed: () {
        GoRouter.of(context).pop();
      },
    );
  }
}
