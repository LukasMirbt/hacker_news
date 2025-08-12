import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    final onMorePressed = context.select(
      (AppCurrentUserCommentData data) => data.onMorePressed,
    );

    return IconButton(
      onPressed: onMorePressed,
      icon: const AppIcon(
        Symbols.more_vert_rounded,
        size: 18,
      ),
    );
  }
}
