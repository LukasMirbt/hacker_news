import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedItemMoreButton extends StatelessWidget {
  const FeedItemMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final data = context.read<AppFeedItemData>();
        data.onMorePressed();
      },
      icon: const AppIcon(
        Symbols.more_vert_rounded,
        size: 18,
      ),
    );
  }
}
