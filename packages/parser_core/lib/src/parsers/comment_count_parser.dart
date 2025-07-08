import 'package:collection/collection.dart';
import 'package:parser_core/parser_core.dart';

class CommentCountParser extends ParserTemplate<int> {
  const CommentCountParser();

  @override
  String? extractText(Element element) {
    final anchorElements = element.querySelectorAll('a');

    final commentAnchor = anchorElements.firstWhereOrNull(
      (a) => a.text.contains('comment'),
    );
    if (commentAnchor == null) return null;

    return commentAnchor.text;
  }

  @override
  int? parseText(String text) {
    final trimmedText = text.trim();

    final match = RegExp(r'^(\d+)').firstMatch(trimmedText);
    if (match == null) return null;

    final commentCountString = match.group(1);
    if (commentCountString == null) return null;

    return int.tryParse(commentCountString);
  }
}
