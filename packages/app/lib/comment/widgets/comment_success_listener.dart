import 'package:app/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CommentSuccessListener extends StatelessWidget {
  const CommentSuccessListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommentBloc, CommentState>(
      listenWhen: (previous, current) =>
          !previous.form.submissionStatus.isSuccess &&
          current.form.submissionStatus.isSuccess,
      listener: (context, state) {
        GoRouter.of(context).pop();
      },
      child: child,
    );
  }
}
