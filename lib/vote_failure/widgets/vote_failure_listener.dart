import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/vote_failure/vote_failure.dart';
import 'package:vote_repository/vote_repository.dart';

class VoteFailureListener extends BlocListener<VoteFailureBloc, VoteState> {
  VoteFailureListener({super.key})
    : super(
        listenWhen: (previous, current) =>
            !previous.isFailure && current.isFailure,
        listener: (context, state) {
          if (state is VoteFailure) {
            final l10n = AppLocalizations.of(context);
            final message = state.message(l10n);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            );
          }
        },
      );
}
