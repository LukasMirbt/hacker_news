import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:hacker_client/post_options/post_options.dart';

class PostOptionsButton extends StatelessWidget {
  const PostOptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        PostOptionsSheet.show(context);
      },
      icon: const AppIcon(Symbols.more_vert_rounded),
    );
  }
}
