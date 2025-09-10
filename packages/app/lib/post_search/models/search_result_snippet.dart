import 'package:app/post_search/post_search.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SearchResultSnippet extends Equatable {
  const SearchResultSnippet({
    required this.text,
    required this.match,
  });

  final String text;
  final SearchMatch match;

  Iterable<String> get characters => text.characters;

  @override
  List<Object> get props => [
    text,
    match,
  ];
}
