import 'package:vote_repository/vote_repository.dart';

class VoteUrlParser {
  const VoteUrlParser();

  ParsedVoteUrl? tryParse(String? upvoteUrl) {
    if (upvoteUrl == null) return null;

    final url = Uri.tryParse(upvoteUrl);
    if (url == null) return null;

    if (url case Uri(
      queryParameters: {
        'id': final String id,
        'auth': final String auth,
        'goto': final String goto,
      },
    )) {
      return ParsedVoteUrl(
        id: id,
        auth: auth,
        goto: goto,
        url: url,
      );
    }

    return null;
  }
}
