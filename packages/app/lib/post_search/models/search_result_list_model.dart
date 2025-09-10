import 'package:app/post_search/post_search.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:post_repository/post_repository.dart';

part 'search_result_list_model.freezed.dart';

@freezed
abstract class SearchResultListModel with _$SearchResultListModel {
  const factory SearchResultListModel({
    required List<Comment> comments,
    required String query,
    @Default(TextParser()) TextParser textParser,
    @Default(SnippetExtractor()) SnippetExtractor snippetExtractor,
  }) = _SearchResultListModel;

  const SearchResultListModel._();

  List<SearchResultModel> get items {
    if (query.isEmpty) return [];

    final matchedResults = <SearchResultModel>[];

    for (final comment in comments) {
      if (matchedResults.length >= 100) break;

      final text = textParser.parse(comment.htmlText);

      final lowerCaseText = text.toLowerCase();
      final lowerCaseQuery = query.toLowerCase();

      if (lowerCaseText.contains(lowerCaseQuery)) {
        final snippet = snippetExtractor.extract(
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
  }
}
