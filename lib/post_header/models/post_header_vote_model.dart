import 'package:hacker_client/post_header/post_header.dart';
import 'package:vote_repository/vote_repository.dart';

class PostHeaderVoteModel {
  const PostHeaderVoteModel();

  PostHeaderModel updateHeader({
    required Vote vote,
    required PostHeaderModel header,
  }) {
    final isIdMatch = vote.id == header.id;
    if (!isIdMatch) return header;
    final updatedHeader = header.vote(vote.type);
    return updatedHeader;
  }
}
