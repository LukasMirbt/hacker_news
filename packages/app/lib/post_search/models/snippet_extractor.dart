import 'package:app/post_search/post_search.dart';

class SnippetExtractor {
  const SnippetExtractor();

  static const _contextLength = 40;

  SearchResultSnippet extract({
    required String text,
    required String query,
  }) {
    final lowerCaseText = text.toLowerCase();
    final lowerCaseQuery = query.toLowerCase();
    final matchIndex = lowerCaseText.indexOf(lowerCaseQuery);

    final queryLength = lowerCaseQuery.length;

    var start = matchIndex - _contextLength;
    var end = matchIndex + queryLength + _contextLength;

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

    final snippet = text.substring(finalStart, finalEnd);

    final match = SearchMatch(
      start: matchIndex - finalStart,
      end: matchIndex - finalStart + queryLength,
      isStartOfText: finalStart == 0,
      isEndOfText: finalEnd == text.length,
    );

    return SearchResultSnippet(
      text: snippet,
      match: match,
    );
  }
}
