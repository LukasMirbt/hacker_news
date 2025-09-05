import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class FeedItemVoteButtonPlaceholder extends StatelessWidget {
  const FeedItemVoteButtonPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return InvisiblePlaceholder(
      visible: false,
      child: AppFeedItemVoteButton(
        data: AppFeedItemVoteButtonData(
          hasBeenUpvoted: false,
          score: '',
          onPressed: () {},
        ),
      ),
    );
  }
}
