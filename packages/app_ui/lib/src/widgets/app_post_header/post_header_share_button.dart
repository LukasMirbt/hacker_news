import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostHeaderShareButton extends StatelessWidget {
  const PostHeaderShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    final onSharePressed = context.select(
      (AppPostHeaderData data) => data.onSharePressed,
    );

    return IconButton(
      onPressed: onSharePressed,
      icon: const Icon(
        Icons.share_outlined,
        size: 16,
      ),
    );
  }
}
