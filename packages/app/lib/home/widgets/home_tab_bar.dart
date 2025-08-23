import 'package:app/home/models/feed_type_extension.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';

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
