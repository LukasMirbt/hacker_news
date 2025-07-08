import 'package:equatable/equatable.dart';
import 'package:vote_repository/vote_repository.dart';

class ParsedVoteUrl extends Equatable {
  const ParsedVoteUrl({
    required this.id,
    required this.auth,
    required this.goto,
    required Uri url,
  }) : _url = url;

  final Uri _url;
  final String id;
  final String auth;
  final String goto;

  Uri toUrl(VoteType type) {
    final queryParameters = {
      ..._url.queryParameters,
      'how': switch (type) {
        VoteType.upvote => 'up',
        VoteType.unvote => 'un',
      },
    };

    final upvoteUrl = _url.replace(
      queryParameters: queryParameters,
    );

    return upvoteUrl;
  }

  @override
  List<Object?> get props => [
    _url,
    id,
    auth,
    goto,
  ];
}
