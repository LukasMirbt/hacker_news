import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostHeaderMoreButton extends StatelessWidget {
  const PostHeaderMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final data = context.read<AppPostHeaderData>();
        data.onMorePressed();
      },
      icon: const AppIcon(
        Symbols.more_vert_rounded,
        size: 22,
      ),
    );
  }
}
