import 'package:post_parser/post_parser.dart';

class CommentListParser {
  const CommentListParser({
    CommentParser? commentParser,
  }) : _commentParser = commentParser ?? const CommentParser();

  final CommentParser _commentParser;

  List<CommentData> parse(Element element) {
    final commentElements = element.querySelectorAll('.athing.comtr');

    final comments = [
      for (final element in commentElements) _commentParser.parse(element),
    ];

    return comments;
  }
}
