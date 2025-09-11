import 'package:app/post_search/post_search.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SearchResultSnippet extends Equatable {
  const SearchResultSnippet({
    required String text,
    required this.match,
  }) : _text = text;

  final String _text;
  final SearchMatch match;

  Iterable<String> get characters => _text.characters;

  @override
  List<Object> get props => [
    _text,
    match,
  ];
}
