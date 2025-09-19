import 'package:app/feed/feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class FeedBuilder {
  const FeedBuilder();

  Widget itemBuilder(BuildContext context, int index) {
    return Column(
      children: [
        FeedItem(index),
        const Divider(height: 0),
      ],
    );
  }

  Widget loadingBuilder(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppSpacing.lg),
      child: PaginationSpinner(),
    );
  }
}
