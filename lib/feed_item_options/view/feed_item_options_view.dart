import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/feed_item_options/feed_item_options.dart';

class FeedItemOptionsView extends StatelessWidget {
  const FeedItemOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBottomSheet(
      children: [
        OpenOnWebOption(),
      ],
    );
  }
}
