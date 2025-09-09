import 'package:app/post_search/post_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PostSearchAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'post_app_bar',
      // Reprovide the Bloc for the Hero animation
      // since Hero context does not have access otherwise.
      child: BlocProvider.value(
        value: context.read<PostSearchBloc>(),
        child: const _AppBar(),
      ),
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
