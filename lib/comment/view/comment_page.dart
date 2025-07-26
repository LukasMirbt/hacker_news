import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:post_repository/post_repository.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final postRepository = context.read<PostRepository>();
        return CommentBloc(
          postRepository: postRepository,
          savedCommentModel: SavedCommentModel(
            postRepository: postRepository,
          ),
        )..add(
          const CommentPostSubscriptionRequested(),
        );
      },
      child: const CommentView(),
    );
  }
}
