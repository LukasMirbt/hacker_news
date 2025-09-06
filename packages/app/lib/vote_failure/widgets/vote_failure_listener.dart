import 'package:app/app_router/app_router.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/login/login.dart';
import 'package:app/vote_failure/vote_failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vote_repository/vote_repository.dart';

class VoteFailureListener extends BlocListener<VoteFailureBloc, VoteState> {
  VoteFailureListener({super.key})
    : super(
        listenWhen: (previous, current) =>
            !previous.isFailure && current.isFailure,
        listener: (context, state) {
          if (state is! VoteFailure) return;

          void showSnackBar(
            String Function(AppLocalizations) message,
          ) {
            final l10n = AppLocalizations.of(context);
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(message(l10n)),
                ),
              );
          }

          switch (state) {
            case UnauthenticatedVote():
              final router = AppRouter.of(context);
              router.push(
                LoginRoute(from: router.currentLocation),
              );
            case InvalidVoteUrl():
              showSnackBar(
                (l10n) => l10n.voteFailure_invalidUrl,
              );
            case UnknownVoteFailure():
              showSnackBar(
                (l10n) => l10n.generalServerError,
              );
          }
        },
      );
}
