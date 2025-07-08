import 'package:flutter/foundation.dart';
import 'package:post_api/post_api.dart';

typedef ParsePostCallback = PostData Function(String html);

@visibleForTesting
PostData parsePost(
  String partialHtml, {
  PostParser parser = const PostParser(),
}) {
  final post = parser.parse(partialHtml);
  return post;
}

class BackgroundPostParser {
  const BackgroundPostParser({
    ParsePostCallback callback = parsePost,
  }) : _callback = callback;

  final ParsePostCallback _callback;

  Future<PostData> parse(String html) {
    final post = compute(_callback, html);
    return post;
  }
}
