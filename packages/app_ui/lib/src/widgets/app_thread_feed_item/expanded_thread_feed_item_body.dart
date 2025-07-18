import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

export 'app_thread_feed_item_data.dart';
export 'thread_feed_item_header_row.dart';
export 'thread_feed_item_html.dart';
export 'thread_feed_item_more_button.dart';
export 'thread_feed_item_user_and_age.dart';
export 'thread_feed_item_vote_button.dart';

class ExpandedThreadFeedItemBody extends StatelessWidget {
  const ExpandedThreadFeedItemBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ThreadFeedItemHeaderRow(),
        _Html(),
      ],
    );
  }
}

class _Html extends StatelessWidget {
  const _Html();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.xlg,
        right: AppSpacing.xlg,
      ),
      child: ThreadFeedItemHtml(),
    );
  }
}
