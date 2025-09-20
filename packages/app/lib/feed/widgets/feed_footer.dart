import 'package:app/feed/feed.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class FeedFooter extends StatelessWidget {
  const FeedFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          FeedSeparator(),
          SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}
