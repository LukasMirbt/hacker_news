import 'package:app_ui/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FeedItemCommentCountButtonPlaceholder extends StatelessWidget {
  const FeedItemCommentCountButtonPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return InvisiblePlaceholder(
      visible: false,
      child: AppFeedItemCommentCountButton(
        data: AppFeedItemCommentCountButtonData(
          commentCount: '',
          onPressed: () {},
        ),
      ),
    );
  }
}
