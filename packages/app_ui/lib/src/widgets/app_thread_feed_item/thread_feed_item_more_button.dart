import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThreadFeedItemMoreButton extends StatelessWidget {
  const ThreadFeedItemMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    final onMorePressed = context.select(
      (AppThreadFeedItemData data) => data.onMorePressed,
    );

    return IconButton(
      onPressed: onMorePressed,
      icon: const Icon(
        Icons.more_vert,
        size: 16,
      ),
    );
  }
}
