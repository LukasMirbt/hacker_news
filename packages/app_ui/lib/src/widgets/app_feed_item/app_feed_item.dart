import 'package:app_ui/app_ui.dart';
import 'package:app_ui/src/widgets/app_feed_item/action_row.dart';
import 'package:app_ui/src/widgets/app_feed_item/content_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

export 'data.dart';

class AppListItem extends StatelessWidget {
  const AppListItem({
    required this.data,
    super.key,
  });

  final AppFeedItemData data;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: data,
      child: const Padding(
        padding: EdgeInsets.only(top: AppSpacing.lg),
        child: Column(
          children: [
            ContentRow(),
            ActionRow(),
          ],
        ),
      ),
    );
  }
}
