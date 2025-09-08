import 'package:equatable/equatable.dart';
import 'package:html/parser.dart';
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
    required this.match,
  }) : _comment = comment;

  final Comment _comment;
  final SearchMatch match;

  String get id => _comment.id;
  String get user => _comment.hnuser.id;

  String get text {
    final document = parse(_comment.htmlText);
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

  String matchedSentence(String query) {
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

  Comment toRepository() => _comment;

  @override
  List<Object> get props => [_comment];
}
