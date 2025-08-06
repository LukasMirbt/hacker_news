import 'package:app_client/app_client.dart';
import 'package:reply_api/reply_api.dart';

class ReplyApi {
  ReplyApi({
    required AppClient appClient,
    ReplyParser? replyParser,
    PostParser? postParser,
  }) : _client = appClient,
       _replyParser = replyParser ?? const ReplyParser(),
       _postParser = postParser ?? const PostParser();

  final AppClient _client;
  final ReplyParser _replyParser;
  final PostParser _postParser;

  Future<ReplyPageData> fetchReplyPage({required String url}) async {
    final response = await _client.http.get<String>(url);
    final html = response.data!;
    final data = _replyParser.parse(html);
    return data;
  }

  Future<void> reply(ReplyForm form) async {
    await _client.http.post<String>(
      'comment',
      options: RedirectValidationOptions(
        contentType: Headers.formUrlEncodedContentType,
      ),
      data: form.toData(),
    );
  }

  Future<List<CommentData>> fetchCommentThread({required String id}) async {
    final response = await _client.http.get<String>(
      'item',
      queryParameters: {'id': id},
    );
    final html = response.data!;
    final post = _postParser.parse(html);
    return post.comments;
  }
}
