import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

export 'app_thread_feed_item_data.dart';
export 'thread_feed_item_header_row.dart';
export 'thread_feed_item_html.dart';
export 'thread_feed_item_more_button.dart';
export 'thread_feed_item_user_and_age.dart';
export 'thread_feed_item_vote_button.dart';

class CollapsedThreadFeedItemBody extends StatelessWidget {
  const CollapsedThreadFeedItemBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThreadFeedItemHeaderRow();
  }
}
