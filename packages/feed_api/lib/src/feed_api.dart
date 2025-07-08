import 'package:app_client/app_client.dart';
import 'package:feed_api/feed_api.dart';

class FeedApi {
  FeedApi({
    required AppClient appClient,
    FeedParser? feedParser,
  }) : _client = appClient,
       _parser = feedParser ?? const FeedParser();

  final AppClient _client;
  final FeedParser _parser;

  Future<FeedPageData> fetchFeedPage(String url) async {
    final response = await _client.http.get<String>(url);
    final html = response.data!;
    final page = _parser.parse(html);
    return page;
  }
}
