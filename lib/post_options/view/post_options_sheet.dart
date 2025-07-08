import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/post_options/post_options.dart';
import 'package:post_repository/post_repository.dart';

class PostOptionsSheet extends StatelessWidget {
  const PostOptionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => PostOptionsBloc(
        postRepository: context.read<PostRepository>(),
      ),
      child: const PostOptionsView(),
    );
  }
}
