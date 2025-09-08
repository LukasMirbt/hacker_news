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
    SelectedComment? selectedComment,
  }) = _PostSearchState;

  const PostSearchState._();

  static String _text(String htmlText) {
    final document = parse(htmlText);
    final buffer = StringBuffer();
    final nodes = document.body?.nodes;

    if (nodes == null) return '';

    for (final node in nodes) {
      final nodeText = node.text;

      if (nodeText == null || nodeText.trim().isEmpty) {
        continue;
      }

      final cleanedText = nodeText.replaceAll(RegExp(r'\s+'), ' ').trim();

      if (buffer.isNotEmpty) {
        buffer.write(' ');
      }

      buffer.write(cleanedText);
    }

    return buffer.toString();
  }

  static String _matchedSentence({
    required String text,
    required String query,
  }) {
    final lowerText = text.toLowerCase();
    final matchIndex = lowerText.indexOf(query);

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

  List<SearchResultModel> get results {
    if (query.isEmpty) return [];

    final allTexts = [
      for (final comment in comments) _text(comment.htmlText),
    ];

    final matchedResults = <SearchResultModel>[];

    for (final (index, originalText) in allTexts.indexed) {
      final comment = comments[index];
      final lowerText = originalText.toLowerCase();
      final lowerQuery = query.toLowerCase();

      if (lowerText.contains(lowerQuery)) {
        final matchedSentence = _matchedSentence(
          text: originalText,
          query: lowerQuery,
        );

        final start = matchedSentence.toLowerCase().indexOf(lowerQuery);

        final end = start + lowerQuery.length;

        if (start == -1) continue;

        final match = SearchMatch(
          start: start,
          end: end,
        );

        matchedResults.add(
          SearchResultModel(
            comment: comment,
            text: matchedSentence,
            match: match,
          ),
        );
      }
    }

    return matchedResults;
  }

  bool isSelected(Comment comment) {
    final selected = selectedComment;
    if (selected == null) return false;
    return selected.comment.id == comment.id;
  }
}
