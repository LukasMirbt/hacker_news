// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_client/l10n/l10n.dart';
import 'package:hacker_client/vote_failure/vote_failure.dart';
import 'package:vote_repository/vote_repository.dart';

void main() async {
  final l10n = await AppLocalizations.delegate.load(Locale('en'));

  group('VoteFailureExtension', () {
    group('message', () {
      test('returns correect value for $InvalidVoteUrl', () {
        final failure = InvalidVoteUrl();
        expect(
          failure.message(l10n),
          l10n.voteFailure_invalidUrl,
        );
      });

      test('returns correct value for $UnknownVoteFailure', () {
        final failure = UnknownVoteFailure();
        expect(
          failure.message(l10n),
          l10n.generalServerError,
        );
      });
    });
  });
}
