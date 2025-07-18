import 'package:thread_parser/thread_parser.dart';

class ThreadFeedParser {
  const ThreadFeedParser({
    ThreadFeedItemParser? threadCommentParser,
  }) : _commentParser = threadCommentParser ?? const ThreadFeedItemParser();

  final ThreadFeedItemParser _commentParser;

  List<ThreadFeedItemData> parse(Document document) {
    final commentElements = document.querySelectorAll('.athing.comtr');

    final comments = [
      for (final athing in commentElements) _commentParser.parse(athing),
    ];

    return comments;
  }
}
