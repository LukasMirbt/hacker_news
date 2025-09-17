import 'package:app/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_repository/post_repository.dart';

class PostPage extends StatelessWidget {
  const PostPage({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PostBloc(
              id: id,
              postRepository: context.read<PostRepository>(),
            )
            ..add(
              const PostSubscriptionRequested(),
            )
            ..add(
              const PostStarted(),
            ),
      child: const PostView(),
    );
  }
}
