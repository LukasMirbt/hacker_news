import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/reply/reply.dart';

class ReplySaveListener extends StatelessWidget {
  const ReplySaveListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReplyBloc, ReplyState>(
      listenWhen: (previous, current) =>
          previous.form.text != current.form.text,
      listener: (context, state) {
        context.read<ReplyBloc>().add(
          const ReplyTextSaved(),
        );
      },
      child: child,
    );
  }
}
