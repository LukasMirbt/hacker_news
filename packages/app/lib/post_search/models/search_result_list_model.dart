// ignore_for_file: annotate_overrides

import 'package:app/post_search/post_search.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_repository/post_repository.dart';
import 'package:text_parser/text_parser.dart';

part 'search_result_list_model.freezed.dart';

@freezed
class SearchResultListModel with _$SearchResultListModel {
  SearchResultListModel({
    required this.comments,
    required this.query,
    TextParser? textParser,
    SnippetExtractor? snippetExtractor,
  }) : _textParser = textParser ?? const TextParser(),
       _snippetExtractor = snippetExtractor ?? const SnippetExtractor();

  final TextParser _textParser;
  final SnippetExtractor _snippetExtractor;
  final List<Comment> comments;
  final String query;

  late final List<SearchResultModel> items = () {
    if (query.isEmpty) return <SearchResultModel>[];

    final matchedResults = <SearchResultModel>[];

    for (final comment in comments) {
      if (matchedResults.length >= 100) break;

      final text = _textParser.parse(comment.htmlText);

      final lowerCaseText = text.toLowerCase();
      final lowerCaseQuery = query.toLowerCase();

      if (lowerCaseText.contains(lowerCaseQuery)) {
        final snippet = _snippetExtractor.extract(
          text: text,
          query: query,
        );

        matchedResults.add(
          SearchResultModel(
            comment: comment,
            snippet: snippet,
          ),
        );
      }
    }

    return matchedResults;
  }();
}
