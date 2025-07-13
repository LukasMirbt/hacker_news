import 'package:thread_parser/thread_parser.dart';

class ThreadCommentListParser {
  const ThreadCommentListParser({
    ThreadCommentParser? threadCommentParser,
  }) : _commentParser = threadCommentParser ?? const ThreadCommentParser();

  final ThreadCommentParser _commentParser;

  List<ThreadCommentData> parse(Document document) {
    final commentElements = document.querySelectorAll('.athing.comtr');

    final comments = [
      for (final athing in commentElements) _commentParser.parse(athing),
    ];

    return comments;
  }
}
