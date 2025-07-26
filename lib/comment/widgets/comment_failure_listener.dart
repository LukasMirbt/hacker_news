import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment/comment.dart';
import 'package:hacker_client/l10n/l10n.dart';

class CommentFailureListener extends StatelessWidget {
  const CommentFailureListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommentBloc, CommentState>(
      listenWhen: (previous, current) =>
          !previous.form.submissionStatus.isFailure &&
          current.form.submissionStatus.isFailure,
      listener: (context, state) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(l10n.generalServerError),
            ),
          );
      },
      child: child,
    );
  }
}
