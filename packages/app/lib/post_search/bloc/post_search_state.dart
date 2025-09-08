import 'package:app/post_search/post_search.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html/parser.dart';
import 'package:post_repository/post_repository.dart';

part 'post_search_state.freezed.dart';

@freezed
abstract class PostSearchState with _$PostSearchState {
  const factory PostSearchState({
    required List<Comment> comments,
    @Default('') String query,
  }) = _PostSearchState;

  const PostSearchState._();

  static String _text(String htmlText) {
    final document = parse(htmlText);
    final buffer = StringBuffer();

    final textNodes = document.body?.nodes;

    if (textNodes != null) {
      for (final node in textNodes) {
        if (buffer.isNotEmpty) {
          buffer.write(' ');
        }
        buffer.write(node.text?.trim());
      }
    }

    return buffer.toString().trim();
  }

  static String _matchedSentence({
    required String text,
    required String query,
  }) {
    final lowerText = text.toLowerCase();
    final lowerQuery = query.toLowerCase();
    final matchIndex = lowerText.indexOf(lowerQuery);

    if (matchIndex == -1) {
      return '';
    }

    const contextLength = 40;
    final queryLength = query.length;

    var start = matchIndex - contextLength;
    var end = matchIndex + queryLength + contextLength;

    if (start < 0) {
      end -= start;
      start = 0;
    }
    if (end > text.length) {
      start -= end - text.length;
      end = text.length;
    }

    start = start.clamp(0, text.length);
    end = end.clamp(0, text.length);

    var finalStart = start;
    if (finalStart > 0) {
      final lastSpace = text.lastIndexOf(' ', finalStart);
      finalStart = (lastSpace == -1) ? 0 : lastSpace + 1;
    }

    var finalEnd = end;
    if (finalEnd < text.length) {
      final nextSpace = text.indexOf(' ', finalEnd);
      finalEnd = (nextSpace == -1) ? text.length : nextSpace;
    }

    final snippet = text.substring(finalStart, finalEnd).trim();

    final startEllipsis = finalStart > 0 ? '...' : '';
    final endEllipsis = finalEnd < text.length ? '...' : '';

    return '$startEllipsis$snippet$endEllipsis';
  }

  List<SearchResult> get results {
    if (query.isEmpty) return [];

    final allTexts = [
      for (final comment in comments) _text(comment.htmlText),
    ];

    final matchedResults = <SearchResult>[];

    for (final (index, item) in allTexts.indexed) {
      final comment = comments[index];
      final text = item.toLowerCase();
      final query = this.query.toLowerCase();

      if (text.contains(query)) {
        final matchedSentence = _matchedSentence(
          text: text,
          query: query,
        );

        final start = matchedSentence.indexOf(query);
        final end = start + query.length;

        final match = SearchMatch(
          start: start,
          end: end,
        );

        matchedResults.add(
          SearchResult(
            comment: comment,
            text: matchedSentence,
            match: match,
          ),
        );
      }
    }

    return matchedResults;
  }
}
