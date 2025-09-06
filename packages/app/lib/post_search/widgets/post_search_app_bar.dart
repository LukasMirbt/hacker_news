import 'package:app/post_search/post_search.dart';
import 'package:flutter/material.dart';

class PostSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PostSearchAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const PostSearchBar(),
    );
  }
}
