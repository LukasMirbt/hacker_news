import 'package:app/post_search/post_search.dart';
import 'package:equatable/equatable.dart';
import 'package:post_repository/post_repository.dart';

class SearchResultModel extends Equatable {
  const SearchResultModel({
    required Comment comment,
    required this.snippet,
  }) : _comment = comment;

  final Comment _comment;
  final SearchResultSnippet snippet;

  String get id => _comment.id;
  String get user => _comment.hnuser.id;
  SearchMatch get match => snippet.match;

  Comment toRepository() => _comment;

  @override
  List<Object> get props => [
    _comment,
    snippet,
  ];
}
