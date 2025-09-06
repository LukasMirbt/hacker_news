import 'package:app/post_search/post_search.dart';
import 'package:flutter/material.dart';

class PostSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PostSearchAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return const Hero(
      tag: 'post_app_bar',
      child: _AppBar(),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: const PostSearchBar(),
    );
  }
}
