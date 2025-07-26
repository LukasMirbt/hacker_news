import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment/comment.dart';

class CommentPostLoadListener extends StatelessWidget {
  const CommentPostLoadListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommentBloc, CommentState>(
      listenWhen: (previous, current) =>
          previous.fetchStatus.isLoading && current.fetchStatus.isSuccess,
      listener: (context, state) {
        context.read<CommentBloc>().add(
          const CommentPostLoaded(),
        );
      },
      child: child,
    );
  }
}
