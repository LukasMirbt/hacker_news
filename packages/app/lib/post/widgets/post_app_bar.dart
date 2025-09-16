import 'package:app/post/post.dart';
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
      // TODO(LukasMirbt): Figure out how to test this
      // Reprovide dependencies for the Hero animation
      // since Hero context does not have access otherwise.
      child: InheritedProvider.value(
        value: context.read<ScrollController>(),
        child: BlocProvider.value(
          value: context.read<PostBloc>(),
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
    final isFailure = context.select(
      (PostBloc bloc) => bloc.state.fetchStatus.isFailure,
    );

    return AppBar(
      leading: const PostBackButton(),
      title: isFailure ? null : const PostAppBarTitle(),
      actions: const [
        PostSearchButton(),
      ],
    );
  }
}
