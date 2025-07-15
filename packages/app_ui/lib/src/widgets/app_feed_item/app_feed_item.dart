import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

export 'app_feed_item_data.dart';
export 'app_feed_item_data_placeholder.dart';
export 'feed_item_action_row.dart';
export 'feed_item_button_placeholder.dart';
export 'feed_item_comment_count_button.dart';
export 'feed_item_content_row.dart';
export 'feed_item_more_button.dart';
export 'feed_item_share_button.dart';
export 'feed_item_subtitle.dart';
export 'feed_item_title.dart';
export 'feed_item_vote_button.dart';

class AppFeedItem extends StatelessWidget {
  const AppFeedItem({
    required this.data,
    super.key,
  });

  final AppFeedItemData data;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: data,
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: AppSpacing.lg),
      child: Column(
        children: [
          FeedItemContentRow(),
          FeedItemActionRow(),
        ],
      ),
    );
  }
}
