import 'package:app/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_launcher/link_launcher.dart';
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
            linkLauncher: context.read<LinkLauncher>(),
            commentDraftSaver: CommentDraftSaver(
              postRepository: postRepository,
            ),
          )
          ..add(
            const CommentPostSubscriptionRequested(),
          )
          ..add(
            const CommentStarted(),
          );
      },
      child: const CommentView(),
    );
  }
}
