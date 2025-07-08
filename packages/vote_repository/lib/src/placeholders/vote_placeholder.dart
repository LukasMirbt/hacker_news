import 'package:vote_repository/vote_repository.dart';

class VotePlaceholder extends Vote {
  VotePlaceholder({
    String? id,
    Uri? url,
    VoteType? type,
  }) : super(
         id: id ?? 'id',
         url: url ?? Uri.parse('https://example.com'),
         type: type ?? VoteType.upvote,
       );
}
