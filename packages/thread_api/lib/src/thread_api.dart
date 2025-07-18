import 'package:app_client/app_client.dart';
import 'package:thread_api/thread_api.dart';

class ThreadApi {
  ThreadApi({
    required AppClient appClient,
    ThreadParser? threadParser,
  }) : _client = appClient,
       _parser = threadParser ?? const ThreadParser();

  final AppClient _client;
  final ThreadParser _parser;

  Future<ThreadFeedPageData> fetchFeedPage(
    ThreadFeedPageUrl pageUrl,
  ) async {
    final response = await _client.http.get<String>(pageUrl.url);
    final html = response.data!;
    final page = _parser.parse(html);
    return page;
  }
}
