import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/post_options/post_options.dart';

class PostOptionsView extends StatelessWidget {
  const PostOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBottomSheet(
      children: [
        OpenOnWebOption(),
      ],
    );
  }
}
