import 'package:equatable/equatable.dart';
import 'package:vote_repository/vote_repository.dart';

class Vote extends Equatable {
  const Vote({
    required this.id,
    required this.url,
    required this.type,
  });

  final String id;
  final Uri url;
  final VoteType type;

  @override
  List<Object?> get props => [
    id,
    url,
    type,
  ];
}
