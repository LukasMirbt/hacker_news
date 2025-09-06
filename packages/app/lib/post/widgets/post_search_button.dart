import 'package:app/app_router/app_router.dart';
import 'package:app/post_search/post_search.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class PostSearchButton extends StatelessWidget {
  const PostSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const AppIcon(Symbols.search_rounded),
      onPressed: () {
        AppRouter.of(context).goRelative(
          const PostSearchRoute(),
        );
      },
    );
  }
}
