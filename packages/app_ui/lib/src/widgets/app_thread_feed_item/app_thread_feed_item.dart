import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

export 'app_thread_feed_item_data.dart';
export 'app_thread_feed_item_data_placeholder.dart';
export 'collapsed_thread_feed_item_body.dart';
export 'expanded_thread_feed_item_body.dart';
export 'thread_feed_item_header_row.dart';
export 'thread_feed_item_html.dart';
export 'thread_feed_item_more_button.dart';
export 'thread_feed_item_user_and_age.dart';
export 'thread_feed_item_vote_button.dart';

class AppThreadFeedItem extends StatelessWidget {
  const AppThreadFeedItem({
    required this.data,
    super.key,
  });

  final AppThreadFeedItemData data;

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
    final isExpanded = context.select(
      (AppThreadFeedItemData data) => data.isExpanded,
    );

    if (isExpanded) return const ExpandedThreadFeedItemBody();

    return const CollapsedThreadFeedItemBody();
  }
}
