import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedItemShareButton extends StatelessWidget {
  const FeedItemShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final data = context.read<AppFeedItemData>();
        data.onSharePressed();
      },
      icon: const AppIcon(
        Symbols.share_rounded,
        size: 16,
      ),
    );
  }
}
