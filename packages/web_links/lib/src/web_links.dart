import 'package:flutter/material.dart';

class WebLinks {
  const WebLinks();

  @visibleForTesting
  static Uri baseUrl = Uri(
    scheme: 'https',
    host: 'news.ycombinator.com',
  );

  Uri get searchUrl => Uri(
    scheme: 'https',
    host: 'hn.algolia.com',
    path: '/',
    queryParameters: {
      'dateRange': 'pastMonth',
    },
  );

  bool isPost(Uri url) {
    return url.host == 'news.ycombinator.com' &&
        url.path == '/item' &&
        url.queryParameters.containsKey('id');
  }

  bool isHackerNews(Uri url) => url.host == 'news.ycombinator.com';

  bool isSearch(Uri url) => url.host == 'hn.algolia.com';

  Uri resolve(String urlString) {
    final url = Uri.parse(urlString);
    if (url.isAbsolute) return url;
    return baseUrl.resolveUri(url);
  }

  Uri itemUrl({required String id}) {
    return baseUrl.replace(
      path: 'item',
      queryParameters: {'id': id},
    );
  }

  Uri userUrl({required String id}) {
    return baseUrl.replace(
      path: 'user',
      queryParameters: {'id': id},
    );
  }

  Uri fromUrl({required String site}) {
    return baseUrl.replace(
      path: 'from',
      queryParameters: {'site': site},
    );
  }
}
