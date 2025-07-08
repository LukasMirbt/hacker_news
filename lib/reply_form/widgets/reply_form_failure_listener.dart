import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/reply_form/reply_form.dart';

class ReplyFormFailureListener extends StatelessWidget {
  const ReplyFormFailureListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReplyFormBloc, ReplyFormState>(
      listenWhen: (previous, current) =>
          !previous.submissionStatus.isFailure &&
          current.submissionStatus.isFailure,
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
