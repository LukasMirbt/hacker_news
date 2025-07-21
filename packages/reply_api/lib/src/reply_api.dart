import 'package:app_client/app_client.dart';
import 'package:reply_api/reply_api.dart';

class ReplyApi {
  ReplyApi({
    required AppClient appClient,
    ReplyParser? replyParser,
  }) : _client = appClient,
       _replyParser = replyParser ?? const ReplyParser();

  final AppClient _client;
  final ReplyParser _replyParser;

  Future<ReplyData> fetchReplyForm({required String url}) async {
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
      data: {'id': id},
    );

    final html = response.data!;

    final document = const HtmlParser().parse(html);
    final commentElement = document.querySelector('.comment-tree');

    final comments = const CommentListParser().parse(commentElement!);
    return comments;
  }
}
