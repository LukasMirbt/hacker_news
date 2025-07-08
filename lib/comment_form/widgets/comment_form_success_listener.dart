import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/comment_form/comment_form.dart';

class CommentFormSuccessListener extends StatelessWidget {
  const CommentFormSuccessListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommentFormBloc, CommentFormState>(
      listenWhen: (previous, current) =>
          !previous.status.isSuccess && current.status.isSuccess,
      listener: (context, state) {
        GoRouter.of(context).pop();
      },
      child: child,
    );
  }
}
