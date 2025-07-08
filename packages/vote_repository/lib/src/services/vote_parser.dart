import 'package:vote_repository/vote_repository.dart';

class VoteParser {
  const VoteParser({VoteUrlParser? urlParser})
    : _urlParser = urlParser ?? const VoteUrlParser();

  final VoteUrlParser _urlParser;

  Vote? tryParse({
    required String? upvoteUrl,
    required bool hasBeenUpvoted,
  }) {
    final parsedUrl = _urlParser.tryParse(upvoteUrl);
    if (parsedUrl == null) return null;

    final type = hasBeenUpvoted ? VoteType.unvote : VoteType.upvote;
    final url = parsedUrl.toUrl(type);

    return Vote(
      id: parsedUrl.id,
      url: url,
      type: type,
    );
  }
}
