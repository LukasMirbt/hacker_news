import 'package:app/home/home.dart';
import 'package:feed_repository/feed_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: FeedType.values.length,
      child: const Column(
        children: [
          HomeTabBar(),
          Expanded(
            child: HomeTabBarView(),
          ),
        ],
      ),
    );
  }
}
