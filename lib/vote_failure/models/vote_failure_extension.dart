import 'package:hacker_client/l10n/l10n.dart';
import 'package:vote_repository/vote_repository.dart';

extension VoteFailureExtension on VoteFailure {
  String message(AppLocalizations l10n) {
    return switch (this) {
      InvalidVoteUrl() => l10n.voteFailure_invalidUrl,
      UnknownVoteFailure() => l10n.generalServerError,
    };
  }
}
