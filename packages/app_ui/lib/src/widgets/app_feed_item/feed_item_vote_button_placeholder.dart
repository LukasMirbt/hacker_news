import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class FeedItemVoteButtonPlaceholder extends StatelessWidget {
  const FeedItemVoteButtonPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return InvisiblePlaceholder(
      visible: true,
      child: SizedBox.fromSize(
        size: const Size(70, 44),
      ),
    );
  }
}
