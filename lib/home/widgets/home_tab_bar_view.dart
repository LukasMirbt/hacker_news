import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/feed/feed.dart';

class HomeTabBarView extends StatelessWidget {
  const HomeTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        for (final feed in FeedType.values) FeedPage(type: feed),
      ],
    );
  }
}
