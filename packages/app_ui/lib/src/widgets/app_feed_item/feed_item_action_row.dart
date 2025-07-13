import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class FeedItemActionRow extends StatelessWidget {
  const FeedItemActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.xxlg,
        right: AppSpacing.lg,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FeedItemVoteButton(),
          FeedItemCommentCountButton(),
          FeedItemShareButton(),
          FeedItemMoreButton(),
        ],
      ),
    );
  }
}
