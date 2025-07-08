import 'package:app_ui/app_ui.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/home/models/feed_type_extension.dart';
import 'package:hacker_client/l10n/l10n.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return TabBar(
      isScrollable: true,
      indicatorPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
      ),
      tabs: [
        for (final feed in FeedType.values)
          Tab(
            text: feed.title(l10n),
          ),
      ],
    );
  }
}
