import 'package:app/l10n/l10n.dart';
import 'package:app/reply/reply.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReplyFailureListener extends StatelessWidget {
  const ReplyFailureListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReplyBloc, ReplyState>(
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
