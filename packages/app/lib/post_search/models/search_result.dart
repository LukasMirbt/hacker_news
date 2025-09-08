import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:post_repository/post_repository.dart';

class SearchMatch extends Equatable {
  const SearchMatch({
    required this.start,
    required this.end,
  });

  final int start;
  final int end;

  @override
  List<Object> get props => [start, end];
}

class SearchResult extends Equatable {
  const SearchResult({
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

  bool isMatchedCharacter(int index) {
    return index >= _match.start && index <= _match.end;
  }

  Comment toRepository() => _comment;

  @override
  List<Object> get props => [_comment];
}
