import 'package:app/feed/feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class FeedBody extends StatelessWidget {
  const FeedBody({
    this.builder = const FeedBuilder(),
    super.key,
  });

  final FeedBuilder builder;

  @override
  Widget build(BuildContext context) {
    return const AppPaginatedList();
  }
}
