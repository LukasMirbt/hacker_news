import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/post/post.dart';

class PostOptionsButton extends StatelessWidget {
  const PostOptionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final state = context.read<PostBloc>().state;
        PostOptionsRoute(postId: state.id).push<void>(context);
      },
      icon: const Icon(Icons.more_vert),
    );
  }
}
