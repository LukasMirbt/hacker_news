import 'package:app/post_search/post_search.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:post_repository/post_repository.dart';

class SearchResultModel extends Equatable {
  const SearchResultModel({
    required Comment comment,
    required String text,
    required SearchMatch match,
  }) : _comment = comment,
       _text = text,
       _match = match;

  final Comment _comment;
  final String _text;
  final SearchMatch _match;

  String get id => _comment.id;
  String get user => _comment.hnuser.id;

  Iterable<String> get characters => _text.characters;

  int get matchLength => _match.end - _match.start;

  bool isMatchedCharacter(int index) {
    return index >= _match.start && index < _match.end;
  }

  Comment toRepository() => _comment;

  @override
  List<Object> get props => [
    _comment,
    _text,
    _match,
  ];
}
