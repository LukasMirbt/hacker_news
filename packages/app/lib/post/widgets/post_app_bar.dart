import 'package:app/post/post.dart';
import 'package:app/post_header/post_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class PostAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PostAppBar({super.key});

  static const heroTag = 'postAppBar';

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: InheritedProvider.value(
        value: context.read<ScrollController>(),
        child: BlocProvider.value(
          value: context.read<PostHeaderBloc>(),
          child: const _AppBar(),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const PostBackButton(),
      title: const PostAppBarTitle(),
      actions: const [
        PostSearchButton(),
      ],
    );
  }
}
