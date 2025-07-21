import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/thread_item_options/thread_item_options.dart';

class ThreadItemOptionsView extends StatelessWidget {
  const ThreadItemOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBottomSheet(
      children: [
        ReplyOption(),
        ContextOption(),
        OpenOnWebOption(),
      ],
    );
  }
}
