import 'package:flutter/material.dart';
import 'package:hacker_client/post_options/post_options.dart';
import 'package:material_symbols_icons/symbols.dart';

class PostOptionsButton extends StatelessWidget {
  const PostOptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        PostOptionsSheet.show(context);
      },
      icon: const Icon(
        Symbols.more_vert,
        opticalSize: 24,
      ),
    );
  }
}
