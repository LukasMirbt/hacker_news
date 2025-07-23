import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_client/reply/reply.dart';

class ReplySuccessListener extends StatelessWidget {
  const ReplySuccessListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReplyBloc, ReplyState>(
      listenWhen: (previous, current) =>
          !previous.submissionStatus.isSuccess &&
          current.submissionStatus.isSuccess,
      listener: (context, state) {
        GoRouter.of(context).pop();
      },
      child: child,
    );
  }
}
