import 'package:app_ui/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FeedItemCommentCountButtonPlaceholder extends StatelessWidget {
  const FeedItemCommentCountButtonPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return InvisiblePlaceholder(
      visible: true,
      child: SizedBox.fromSize(
        size: const Size(88, 44),
      ),
    );
  }
}
