import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/comment_form/comment_form.dart';
import 'package:hacker_client/l10n/l10n.dart';

class CommentFormFailureListener extends StatelessWidget {
  const CommentFormFailureListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommentFormBloc, CommentFormState>(
      listenWhen: (previous, current) =>
          !previous.status.isFailure && current.status.isFailure,
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
