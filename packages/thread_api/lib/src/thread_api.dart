import 'package:app_client/app_client.dart';
import 'package:thread_api/thread_api.dart';

class ThreadApi {
  ThreadApi({
    required AppClient appClient,
    ThreadParser? threadParser,
  }) : _client = appClient,
       _threadParser = threadParser ?? const ThreadParser();

  final AppClient _client;
  final ThreadParser _threadParser;

  Future<ThreadFeedPageData> fetchFeedPage(
    ThreadFeedPageUrl pageUrl,
  ) async {
    final response = await _client.http.get<String>(pageUrl.url);
    final html = response.data!;
    final page = _threadParser.parse(html);
    return page;
  }
}
