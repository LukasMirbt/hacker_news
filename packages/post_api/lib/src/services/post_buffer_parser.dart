import 'package:post_api/post_api.dart';

class PostBufferParser {
  const PostBufferParser({
    BackgroundPostParser? parser,
  }) : _parser = parser ?? const BackgroundPostParser();

  final BackgroundPostParser _parser;

  Future<PostData> parse(StringBuffer buffer) async {
    final html = buffer.toString();
    final post = await _parser.parse(html);
    return post;
  }
}
