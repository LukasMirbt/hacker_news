import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostHeaderShareButton extends StatelessWidget {
  const PostHeaderShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final data = context.read<AppPostHeaderData>();
        data.onSharePressed();
      },
      icon: const AppIcon(
        Symbols.share_rounded,
        size: 20,
      ),
    );
  }
}
