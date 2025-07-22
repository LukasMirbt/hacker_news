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
      icon: const Icon(Icons.more_vert),
    );
  }
}
