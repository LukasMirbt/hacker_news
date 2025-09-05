import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedItemVoteButton extends StatelessWidget {
  const FeedItemVoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final voteButton = context.select(
      (AppFeedItemData data) => data.voteButton,
    );

    if (voteButton != null) return voteButton;

    return const FeedItemVoteButtonPlaceholder();
  }
}
